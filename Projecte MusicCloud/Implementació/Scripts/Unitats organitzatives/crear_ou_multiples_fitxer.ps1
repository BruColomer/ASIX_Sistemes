param(
    [Parameter(Mandatory=$false)]
    [string]$fitxer = "C:\Users\Administrator\Scripts\Dades\uo_a_crear.csv",
    [Parameter(Mandatory=$false)]
    [string]$ruta = "DC=musiccloud,DC=local"
)

function provarfitxer {
    try {
        $existeix = Get-Item "$fitxer" -ErrorAction Stop
    }
    catch {
        exit
    }
}
function provarruta {
    try {
        $OU = Get-ADObject -Identity "$ruta" -ErrorAction Stop
    }
    catch {
        exit
    }
}
function buscar-ou {
    param(
        [parameter(mandatory=$true)]
        [string]$nom
    )
    try {
        $OU = Get-ADOrganizationalUnit -Identity "OU=$nom,$ruta" -ErrorAction Stop
    }
    catch {
        $OU = $null
    }
    return $OU
}
function crear-ou {
    param(
        [parameter(mandatory=$true)]
        [string]$nom
    )
    try {
        New-ADOrganizationalUnit -Name $nom -Path $ruta -ErrorAction Stop
    }
    catch {
        return
    }
}

################# Main ##################

provarfitxer
provarruta

# Recorrem cada nom d'OU del CSV
foreach ($nom in (Import-Csv $fitxer).UO) {
    $OU = buscar-ou -nom $nom

    if (-not $OU) {
        crear-ou -nom $nom
    }
}
