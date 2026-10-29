$ou = Get-ADOrganizationalUnit -Filter * | Where-Object DistinguishedName -eq "OU=MusicCloud,DC=musiccloud,DC=local"
if ($ou -eq $null) {
    New-ADOrganizationalUnit -Name "MusicCloud" -Path "DC=musiccloud,DC=local"
}

$ou = Get-ADOrganizationalUnit -Filter * | Where-Object DistinguishedName -eq "OU=Usuaris,OU=MusicCloud,DC=musiccloud,DC=local"
if ($ou -eq $null) {
    New-ADOrganizationalUnit -Name "Usuaris" -Path "OU=MusicCloud,DC=musiccloud,DC=local"
}

$ou = Get-ADOrganizationalUnit -Filter * | Where-Object DistinguishedName -eq "OU=Equips,OU=MusicCloud,DC=musiccloud,DC=local"
if ($ou -eq $null) {
    New-ADOrganizationalUnit -Name "Equips" -Path "OU=MusicCloud,DC=musiccloud,DC=local"
}

$ou = Get-ADOrganizationalUnit -Filter * | Where-Object DistinguishedName -eq "OU=Grups,OU=MusicCloud,DC=musiccloud,DC=local"
if ($ou -eq $null) {
    New-ADOrganizationalUnit -Name "Grups" -Path "OU=MusicCloud,DC=musiccloud,DC=local"
}
