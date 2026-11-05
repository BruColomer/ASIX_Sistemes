param(
    [Parameter(Mandatory=$true)]
    [string[]]$llista_grups,
    [Parameter(Mandatory=$false)]
    [string]$ruta_grups = "OU=Grups,OU=MusicCloud,DC=musiccloud,DC=local"
)

function provarruta {
    try {
        $existeix = Get-ADObject -Identity "$ruta_grups" -ErrorAction Stop
    }
    catch {
        exit
    }
}

function buscar-grup {
    param(
        [parameter(mandatory=$true)]
        [string]$nom_grup
    )
    try {
        $grup_trobat = Get-ADGroup -Identity $nom_grup -ErrorAction Stop
    }
    catch {
        $grup_trobat = $null
    }
    return $grup_trobat
}

function crear-grup {
    param(
        [parameter(mandatory=$true)]
        [string]$nom_grup
    )
    try {
        New-ADGroup -Name $nom_grup -GroupScope Global -GroupCategory Security -Path $ruta_grups -ErrorAction Stop
    }
    catch {
        return
    }
}

################# Main ##################

provarruta

# Recorrem cada nom de grup
foreach ($nom_grup in $llista_grups) {
    $grup_trobat = buscar-grup -nom_grup $nom_grup

    if (-not $grup_trobat) {
        crear-grup -nom_grup $nom_grup
    }
}
