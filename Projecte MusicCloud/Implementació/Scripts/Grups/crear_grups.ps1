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

provarruta

New-ADGroup -Name $nom_grup -GroupScope Global -GroupCategory Security -Path $ruta_grups
