param(
    [Parameter()]
    [string]$nom,
    
    [Parameter()]
    [string]$ruta
)

New-ADOrganizationalUnit -Name $nom -Path $ruta
