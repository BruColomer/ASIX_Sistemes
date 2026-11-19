param(
    [Parameter(Mandatory=$false)]
    [string]$fitxer = "C:\Users\Administrator\Scripts\Dades\uo_a_crear.csv"
)
$logs = "C:\Users\Administrator\Scripts\Logs\crear_ou_multiples_fitxer"

# Si la ruta no existeix, l'UO es crea dins d'aquesta
$ruta_per_defecte = "OU=UO_MusicCloud,DC=musiccloud,DC=local"

function provar_ruta_logs {
    if (-not (Test-Path $logs)) {
        try {
            New-Item -ItemType Directory -Path $logs -ErrorAction Stop | Out-Null
        }
        catch {
            exit
        }
    }
    if (-not (Test-Path "$logs\crear_ou.log")) {
        New-Item -ItemType File -Path "$logs\crear_ou.log" | Out-Null
    }
    if (-not (Test-Path "$logs\crear_ou.warn")) {
        New-Item -ItemType File -Path "$logs\crear_ou.warn" | Out-Null
    }
    if (-not (Test-Path "$logs\crear_ou.err")) {
        New-Item -ItemType File -Path "$logs\crear_ou.err" | Out-Null
    }
}
function registrar_log {
    param(
        [parameter(mandatory=$true)]
        [string]$nivell,
        [parameter(mandatory=$true)]
        [string]$missatge
    )
    $data = get-date -format "yyyy-MM-dd HH:mm:ss"

    switch ($nivell) {
        "INFO" { Write-Information "$data [INFO] $missatge" 6>> "$logs\crear_ou.log" }
        "WARN" { Write-Warning "$data [WARN] $missatge" 3>> "$logs\crear_ou.warn" }
        "ERR" { Write-Error "$data [ERR] $missatge" 2>> "$logs\crear_ou.err" }
    }
}
function provarfitxer {
    try {
        $existeix = Get-Item "$fitxer" -ErrorAction Stop
    }
    catch {
        registrar_log "ERR" "$_"
        exit
    }
}
function provarruta {
    param(
        [parameter(mandatory=$true)]
        [string]$ruta
    )
    try {
        $UO = Get-ADObject -Identity "$ruta" -ErrorAction Stop
        return $true
    }
    catch {
        return $false
    }
}
function buscar-uo {
    param(
        [parameter(mandatory=$true)]
        [string]$nom,
        [parameter(mandatory=$true)]
        [string]$ruta
    )
    try {
        $UO = Get-ADOrganizationalUnit -Identity "OU=$nom,$ruta" -ErrorAction Stop
    }
    catch {
        $UO = $null
    }
    return $UO
}
function crear-uo {
    param(
        [parameter(mandatory=$true)]
        [string]$nom,
        [parameter(mandatory=$true)]
        [string]$ruta
    )
    try {
        New-ADOrganizationalUnit -Name $nom -Path $ruta -ErrorAction Stop
    }
    catch {
        registrar_log "ERR" "$_"
        return
    }
    registrar_log "INFO" "UO $nom creada a $ruta"
}

################# Main ##################

provar_ruta_logs
registrar_log "INFO" "Escrit executat"
provarfitxer

# Recorrem cada fila del CSV (nom d'UO i ruta)
foreach ($fila in (Import-Csv $fitxer)) {
    $nom = $fila.UO
    $ruta = $fila.RUTA

    # Si la ruta no existeix, l'UO va dins d'UO_MusicCloud
    if (-not (provarruta -ruta $ruta)) {
        registrar_log "WARN" "No existeis la $ruta es canvia per la de defecte"
        $ruta = $ruta_per_defecte
    }

    # Si la uo existeix no es crea, sino es crea a la ruta indicada
    $UO = buscar-uo -nom $nom -ruta $ruta

    if (-not $UO) {
        crear-uo -nom $nom -ruta $ruta
    }
    else {
        registrar_log "INFO" "La UO $nom ja existeix"
    }
}

registrar_log "INFO" "Final de l'escript"
