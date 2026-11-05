param(
    [Parameter(Mandatory=$true)]
    [string]$nom_grup,
    [Parameter(Mandatory=$false)]
    [string]$ruta_grups = "OU=Grups,OU=MusicCloud,DC=musiccloud,DC=local"
)

New-ADGroup -Name $nom_grup -GroupScope Global -GroupCategory Security -Path $ruta_grups
