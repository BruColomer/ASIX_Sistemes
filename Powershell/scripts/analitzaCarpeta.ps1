
$total_elements = (get-childitem).count
$cinc_primersgrans = get-childitem | sort-object length -descending | select-object -first 5
$nom_mida = $cinc_primersgrans | select-object name, length

"________________________________"
"Nombre total d'elements: $total_elements"
"________________________________"
$nom_mida