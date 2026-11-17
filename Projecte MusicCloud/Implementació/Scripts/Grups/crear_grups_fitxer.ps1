param(
    [Parameter(Mandatory=$false)]
    [string]$fitxer = "C:\Users\Administrator\Scripts\Dades\grups_a_crear.csv"
)

# Si la ruta del CSV no existeix, el grup es crea dins d'aquesta
$ruta_uo_grups = "OU=UO_Grups,OU=UO_MusicCloud,DC=musiccloud,DC=local"

function provarfitxer {
    try {
        $fitxer_trobat = Get-Item "$fitxer" -ErrorAction Stop
    }
    catch {
        exit
    }
}
function provarruta {
    param(
        [parameter(mandatory=$true)]
        [string]$ruta_desti
    )
    try {
        $ruta_trobada = Get-ADObject -Identity "$ruta_desti" -ErrorAction Stop
        return $true
    }
    catch {
        return $false
    }
}
function buscar-grup {
    param(
        [parameter(mandatory=$true)]
        [string]$nom_del_grup
    )
    try {
        $grup_existent = Get-ADGroup -Identity $nom_del_grup -ErrorAction Stop
    }
    catch {
        $grup_existent = $null
    }
    return $grup_existent
}
function crear-grup {
    param(
        [parameter(mandatory=$true)]
        [string]$nom_del_grup,
        [parameter(mandatory=$true)]
        [string]$ruta_desti
    )
    try {
        New-ADGroup -Name $nom_del_grup -GroupScope Global -GroupCategory Security -Path $ruta_desti -ErrorAction Stop
    }
    catch {
        return
    }
}
function afegir-membre {
    param(
        [parameter(mandatory=$true)]
        [string]$grup_contenidor,
        [parameter(mandatory=$true)]
        [string]$grup_membre
    )
    try {
        Add-ADGroupMember -Identity $grup_contenidor -Members $grup_membre -ErrorAction Stop
    }
    catch {
        return
    }
}

################# Main ##################

provarfitxer

# recorrem cada fila i creem els grups
foreach ($linia in (Import-Csv $fitxer)) {
    $nom_del_grup = $linia.GRUP
    $ruta_desti = $linia.RUTA

    # Si la ruta no existeix, el grup va dins d'UO_Grups
    if (-not (provarruta -ruta_desti $ruta_desti)) {
        $ruta_desti = $ruta_uo_grups
    }

    # Si el grup ja existeix no es crea
    $grup_existent = buscar-grup -nom_del_grup $nom_del_grup

    if (-not $grup_existent) {
        crear-grup -nom_del_grup $nom_del_grup -ruta_desti $ruta_desti
    }
}

# Afegim els membres
foreach ($linia in (Import-Csv $fitxer)) {
    if ($linia.MEMBRE) {
        afegir-membre -grup_contenidor $linia.MEMBRE -grup_membre $linia.GRUP
    }
}
