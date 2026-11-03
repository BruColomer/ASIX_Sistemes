- Crear una script que crei una ou amb valors fixes, fent servir variables.

>📄 [1.crear_ou_variables.ps1](<Scripts/Unitats organitzatives/Script creacio ou variables/1.crear_ou_variables.ps1>)

Prova:

```powershell
.\1.crear_ou_variables.ps1
```

Ha funcionat, crea la ou Prova dins MusicCloud.

- Crear un script que crei una ou amb nomes el nom de la ou com a dada d'entrada

>📄 [2.crear_ou_nom.ps1](<Scripts/Unitats organitzatives/Script creacio ou variables/2.crear_ou_nom.ps1>)

- Crear un script on el nom i la ruta son variables

>📄 [3.crear_ou_nom_ruta.ps1](<Scripts/Unitats organitzatives/Script creacio ou variables/3.crear_ou_nom_ruta.ps1>)

- Modifica l'script anterior perque l'ordre dels arguments no sigui important.

>📄 [4.crear_ou_ordre.ps1](<Scripts/Unitats organitzatives/Script creacio ou variables/4.crear_ou_ordre.ps1>)

- El nom de l'OU sigui obligatori i que la ruta si no s'especifica prengui un valor per defecte.

>📄 [5.crear_ou_obligatori.ps1](<Scripts/Unitats organitzatives/Script creacio ou variables/5.crear_ou_obligatori.ps1>)

- L'script ha de funcionar en totes les situacions

>📄 [6.crear_ou_totes_situacions.ps1](<Scripts/Unitats organitzatives/Script creacio ou variables/6.crear_ou_totes_situacions.ps1>)

- Que es puguin crear multiples ou a la begada

>📄 [7.crear_ou_multiples.ps1](<Scripts/Unitats organitzatives/Script creacio ou variables/7.crear_ou_multiples.ps1>)

- Fer servir funcions dins l'script

>📄 [8.Crear_ou_multiples_funcions.ps1](<Scripts/Unitats organitzatives/Script creacio ou variables/8.Crear_ou_multiples_funcions.ps1>)

Proves:

```powershell
.\8.Crear_ou_multiples_funcions.ps1 -nomOU Nova1 -ruta "OU=Proves,DC=musiccloud,DC=local"
.\8.Crear_ou_multiples_funcions.ps1 -nomOU Nova1 -ruta "OU=Proves,DC=musiccloud,DC=local"
.\8.Crear_ou_multiples_funcions.ps1 -nomOU A,B,C -ruta "OU=Proves,DC=musiccloud,DC=local"
.\8.Crear_ou_multiples_funcions.ps1 -nomOU X -ruta "OU=NoExisteix,DC=musiccloud,DC=local"
.\8.Crear_ou_multiples_funcions.ps1 -ruta "OU=Proves,DC=musiccloud,DC=local"
```

- Una ou nova: ha funcionat, la crea.
- La mateixa ou un altre cop: ha funcionat, no la duplica ni dona error.
- Diverses ou a la vegada: ha funcionat, crea A, B i C.
- Ruta que no existeix: ha funcionat, l'escript surt i no crea res.
- Sense `-nomOU`: ha funcionat, em demana el nom de la ou.
