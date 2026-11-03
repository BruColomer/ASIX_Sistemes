param(
    [Parameter(Mandatory=$true)]
    [string[]]$nomOU,
    [Parameter(Mandatory=$false)]
    [string]$ruta = "DC=musiccloud,DC=local"
)

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

provarruta

# Recorrem cada nom d'OU
foreach ($nom in $nomOU) {
    $OU = buscar-ou -nom $nom

    if (-not $OU) {
        crear-ou -nom $nom
    }
}
