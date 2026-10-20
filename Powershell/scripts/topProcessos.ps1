$processos = get-process | sort-object cpu -Descending | select -first 10 | select-object name, id, cpu
$totalprocessos = (get-process).count

$processos

"___________________________________________"
"Nombre total de processos: $totalprocessos"
