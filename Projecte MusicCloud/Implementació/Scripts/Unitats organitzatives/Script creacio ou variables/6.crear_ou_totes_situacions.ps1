param(
    [Parameter(Mandatory=$true)]
    [string]$nomOU,
    [Parameter(Mandatory=$false)]
    [string]$ruta = "DC=musiccloud,DC=local"
)

try {
    $OU = Get-ADObject -Identity "$ruta" -ErrorAction Stop
}
catch {
    exit
}

try {
    $OU = Get-ADOrganizationalUnit -Identity "OU=$nomOU,$ruta" -ErrorAction Stop
}
catch {
    $OU = $null
}

if (-not $OU) {
    try {
        New-ADOrganizationalUnit -Name $nomOU -Path $ruta -ErrorAction Stop
    }
    catch {
        exit
    }
}
