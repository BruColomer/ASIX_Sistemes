foreach ($proc in Get-Process) {
    Write-Host "============================== $($proc.ProcessName) ($($proc.Id)) =============================="
    Write-Host ""
    Write-Host "Total threads: $($proc.Threads.Count)"
    Write-Host ""

    foreach ($thread in $proc.Threads) {
        Write-Host "ID: $($thread.Id) CPU TIME: $($thread.TotalProcessorTime)"
    }

    Write-Host ""
}