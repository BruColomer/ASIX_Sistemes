Crear un script que creï grups de seguretat, un o diversos a la vegada, dins la ou Grups

>📄 [crear_grups.ps1](<Scripts/Grups/crear_grups.ps1>)

Proves:

```powershell
.\crear_grups.ps1 GR_Direccio
.\crear_grups.ps1 GR_Direccio
.\crear_grups.ps1 -llista_grups GR_Administracio,GR_Suport_Tecnic,GR_Produccio_Musical,GR_Informatica,GR_Externs,GR_Campanya_Estiu
.\crear_grups.ps1 -llista_grups GR_Administracio_Caps,GR_Suport_Tecnic_Caps,GR_Produccio_Musical_Caps,GR_Informatica_Admins
.\crear_grups.ps1 -llista_grups GR_Prova -ruta_grups "OU=NoExisteix,DC=musiccloud,DC=local"
```

Ha funcionat i no mostra cap error. Sense `-ruta_grups` crea el grup GR_Direcio dins la ou Grups, i si es torna a ecutar no fa res ni el duplica. Amb diversos noms els crea tots a la vegada, primer els sis grups dels departaments i despres els quatre dels caps i dels administradors. Amb una ruta que no existeix lescript surt i no crea res. Tots els grups queden de tipus seguretat i d'ambit global.

- Que els noms dels grups es llegeixin d'un fitxer CSV 

>📄 [crear_grups.ps1](<Scripts/Scripts amb fitxers/crear_grups.ps1>)
>📄 [grups_a_crear.csv](<Scripts/Scripts amb fitxers/Dades/grups_a_crear.csv>)

Proves:

```powershell
.\crear_grups.ps1
.\crear_grups.ps1 -fitxer "C:\Users\Administrator\Scripts\Scripts amb fitxers\Dades\prova_grups.csv" -ruta_grups "OU=Proves,DC=musiccloud,DC=local"
.\crear_grups.ps1 -fitxer "C:\Users\Administrator\Scripts\Scripts amb fitxers\Dades\prova_grups.csv" -ruta_grups "OU=Proves,DC=musiccloud,DC=local"
.\crear_grups.ps1 -fitxer "C:\Users\Administrator\Scripts\Scripts amb fitxers\Dades\noexisteix.csv" -ruta_grups "OU=Proves,DC=musiccloud,DC=local"
.\crear_grups.ps1 -fitxer "C:\Users\Administrator\Scripts\Scripts amb fitxers\Dades\prova_grups.csv" -ruta_grups "OU=NoExisteix,DC=musiccloud,DC=local"
```

Ha funcionat i no mostra cap error. Sense `-fitxer` llegeix el CSV per defecte i, com que els grups ja existeixen, no fa res ni els duplica. Amb un CSV de prova de tres noms (Prova1, Prova2 i Prova3) crea els tres grups dins la ruta, de tipus seguretat i d'ambit global, i si es torna a executar no els duplica. Amb un fitxer que no existeix o amb una ruta que no existeix, l'escript surt i no crea res.
