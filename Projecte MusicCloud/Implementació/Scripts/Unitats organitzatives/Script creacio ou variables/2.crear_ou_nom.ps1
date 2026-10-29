param($nom)

$ruta = "OU=MusicCloud,DC=musiccloud,DC=local"
New-ADOrganizationalUnit -Name $nom -Path $ruta
