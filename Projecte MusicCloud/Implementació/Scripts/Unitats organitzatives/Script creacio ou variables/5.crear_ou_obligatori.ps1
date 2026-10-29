param(
    [Parameter(Mandatory=$true)]
    [string]$nom,
    [Parameter(Mandatory=$false)]
    [string]$ruta = "DC=musiccloud,DC=local"
)

New-ADOrganizationalUnit -Name $nom -Path $ruta
