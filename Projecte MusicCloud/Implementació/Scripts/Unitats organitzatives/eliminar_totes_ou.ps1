Get-ADOrganizationalUnit -Filter * | Where-Object DistinguishedName -like "*OU=MusicCloud*" | Set-ADOrganizationalUnit -ProtectedFromAccidentalDeletion $false
Remove-ADOrganizationalUnit "OU=MusicCloud,DC=musiccloud,DC=local" -Recursive -Confirm:$false
