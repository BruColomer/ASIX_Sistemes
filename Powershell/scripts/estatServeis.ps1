$total = (get-service).count
$running = (get-service | where-object status -eq Running).count
$not_running = (get-service | where-object status -ne Running).count
write-host "===== ESTAT DELS SERVEIS ====="
write-host "Total: $total"
write-host "Running: $running"
write-host "Not Running: $not_running"