param(
    [Parameter(Mandatory=$false)]
    [string]$fitxer = "C:\Users\Administrator\Scripts\Dades\grups_a_crear.csv"
)

$logs = "C:\Users\Administrator\Scripts\Logs\crear_grups_fitxer"


# Si la ruta del CSV no existeix, el grup es crea dins d'aquesta
$ruta_uo_grups = "OU=UO_Grups,OU=UO_MusicCloud,DC=musiccloud,DC=local"

function provarfitxer {
    try {
        $fitxer_trobat = Get-Item "$fitxer" -ErrorAction Stop
    }
    catch {
        registrar_log "ERR" "$_"
        exit
    }
}
function provarruta {
    param(
        [parameter(mandatory=$true)]
        [string]$ruta_desti
    )
    try {
        $ruta_trobada = Get-ADObject -Identity "$ruta_desti" -ErrorAction Stop
        return $true
    }
    catch {

        return $false
    }
}
function buscar-grup {
    param(
        [parameter(mandatory=$true)]
        [string]$nom_del_grup
    )
    try {
        $grup_existent = Get-ADGroup -Identity $nom_del_grup -ErrorAction Stop
    }
    catch {
        $grup_existent = $null
    }
    return $grup_existent
}
function crear-grup {
    param(
        [parameter(mandatory=$true)]
        [string]$nom_del_grup,
        [parameter(mandatory=$true)]
        [string]$ruta_desti
    )
    try {
        New-ADGroup -Name $nom_del_grup -GroupScope Global -GroupCategory Security -Path $ruta_desti -ErrorAction Stop
    }
    catch {
        registrar_log "ERR" "$_"
        return
    }
    registrar_log "INFO" "Grup $nom_del_grup crat a $ruta_desti"

}
function afegir-membre {
    param(
        [parameter(mandatory=$true)]
        [string]$grup_contenidor,
        [parameter(mandatory=$true)]
        [string]$grup_membre
    )
    try {
        Add-ADGroupMember -Identity $grup_contenidor -Members $grup_membre -ErrorAction Stop
    }
    catch {
        registrar_log "ERR" "$_"
        return
    }
    registrar_log "INFO" "Grup $grup_membre afegit a $grup_contenidor"
}
function provar_ruta_logs {
    if (-not (Test-Path $logs)) {
        try {
            New-Item -ItemType Directory -Path $logs -ErrorAction Stop | Out-Null
        }
        catch {
            exit
        }
    }
    if (-not (Test-Path "$logs\crear_grups.log")) {
        New-Item -ItemType File -Path "$logs\crear_grups.log" | Out-Null
    }
    if (-not (Test-Path "$logs\crear_grups.warn")) {
        New-Item -ItemType File -Path "$logs\crear_grups.warn" | Out-Null
    }
    if (-not (Test-Path "$logs\crear_grups.err")) {
        New-Item -ItemType File -Path "$logs\crear_grups.err" | Out-Null
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
        "INFO" { Write-Information "$data [INFO] $missatge" 6>> "$logs\crear_grups.log" }
        "WARN" { Write-Warning "$data [WARN] $missatge" 3>> "$logs\crear_grups.warn" }
        "ERR" { Write-Error "$data [ERR] $missatge" 2>> "$logs\crear_grups.err" }
    }
}


################# Main ##################

provar_ruta_logs
registrar_log "INFO" "Scrip executat"
provarfitxer

# recorrem cada fila i crem els grups
foreach ($linia in (Import-Csv $fitxer)) {
    $nom_del_grup = $linia.GRUP
    $ruta_desti = $linia.RUTA

    # Si la ruta no existeix, el grup va dins d'UO_Grups
    if (-not (provarruta -ruta_desti $ruta_desti)) {
        registrar_log "WARN" "No existeix la ruta $ruta_desti, es canvia per la de defecte"
        $ruta_desti = $ruta_uo_grups
    }

    # Si el grup ja existeix no es crea
    $grup_existent = buscar-grup -nom_del_grup $nom_del_grup

    if (-not $grup_existent) {
        crear-grup -nom_del_grup $nom_del_grup -ruta_desti $ruta_desti
    }
    else {
        registrar_log "INFO" "El grup $nom_del_grup ja existeix"
    }
}

# Afegim els membres
foreach ($linia in (Import-Csv $fitxer)) {
    if ($linia.MEMBRE) {
        afegir-membre -grup_contenidor $linia.MEMBRE -grup_membre $linia.GRUP
    }
}

registrar_log "INFO" "Script finalitzat"
