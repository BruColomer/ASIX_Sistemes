$equp = get-host | select-object -expandProperty name
$usuari = whoami
$powershell = get-host | select-object -expandProperty version
$data = get-date
$directori = get-location
write-host "===== INFORMACIO DEL SISTEMA ====="
write-host "Equip: $equp"
write-host "Usuari: $usuari"
write-host "PowerShell: $powershell"
write-host "Data: $data"
write-host "Directori Actual: $directori"