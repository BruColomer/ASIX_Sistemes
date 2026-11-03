param(
    [Parameter(Mandatory=$true)]
    [string[]]$nomOU,
    [Parameter(Mandatory=$false)]
    [string]$ruta = "DC=musiccloud,DC=local"
)

try {
    $OU = Get-ADObject -Identity "$ruta" -ErrorAction Stop
}
catch {
    exit
}

# Recorrem cada nom d'OU
foreach ($nom in $nomOU) {
    try {
        $OU = Get-ADOrganizationalUnit -Identity "OU=$nom,$ruta" -ErrorAction Stop
    }
    catch {
        #si no existeix borrem el contigut de ou
        $OU = $null
    }

    if (-not $OU) {
        try {
            New-ADOrganizationalUnit -Name $nom -Path $ruta -ErrorAction Stop
        }
        catch {
            continue
        }
    }
}
