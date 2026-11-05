param(
    [Parameter(Mandatory=$true)]
    [string]$nom_grup,
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
    try {
        $grup_trobat = Get-ADGroup -Identity $nom_grup -ErrorAction Stop
    }
    catch {
        $grup_trobat = $null
    }
    return $grup_trobat
}

provarruta

$grup_trobat = buscar-grup

if (-not $grup_trobat) {
    New-ADGroup -Name $nom_grup -GroupScope Global -GroupCategory Security -Path $ruta_grups
}
