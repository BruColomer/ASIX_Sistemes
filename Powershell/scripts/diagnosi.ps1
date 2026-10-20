"
=====================
      PROCESSOS          
=====================
"
$cinc_mescpu = get-process | sort-object cpu -descending | select-object -first 5 name, id, cpu

"Els cinc processos amb mes CPU"
"________________________________"
$cinc_mescpu

"
=====================
       SERVEIS
=====================
"
$total_serveis = (get-service).count
$serveis_actius = (Get-Service | Where-Object Status -eq 'Running').count
$serveis_inactius = (Get-Service | Where-Object Status -ne 'Running').count

"Total de serveis: $total_serveis"
"Serveis en execucio: $serveis_actius"
"Serveis no executats: $serveis_inactius"

"
=====================
       FITXERS
=====================
"

$total_elements = (get-childitem).count
$cinc_primersgrans = get-childitem | sort-object length -descending | select-object -first 5
$nom_mida = $cinc_primersgrans | select-object name, length
"________________________________"
"Nombre total d'elements: $total_elements"
"________________________________"
$nom_mida | format-table

"
========= RESUM ==========
"
$processos_analitzats = (get-process).count
$serveis_analitzats = (get-service).count
$fitxers_analitzats = (get-childItem).count

"Processos analitzats: $processos_analitzats"
"Serveis analitzats: $serveis_analitzats"
"Fitxers analitzats: $fitxers_analitzats"