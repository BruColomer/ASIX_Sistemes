- Crear una script que crei una ou amb valors fixes, fent servir variables.

>📄 [1.crear_ou_variables.ps1](<Scripts/Unitats organitzatives/Script creacio ou variables/1.crear_ou_variables.ps1>)

Prova:

```powershell
.\1.crear_ou_variables.ps1
```

Ha funcionat, crea la ou Prova dins MusicCloud.

- Crear un script que crei una ou amb nomes el nom de la ou com a dada d'entrada

>📄 [2.crear_ou_nom.ps1](<Scripts/Unitats organitzatives/Script creacio ou variables/2.crear_ou_nom.ps1>)

Proves:

```powershell
.\2.crear_ou_nom.ps1 -nom Prova1
.\2.crear_ou_nom.ps1 Prova2
.\2.crear_ou_nom.ps1 -nom Prova1
.\2.crear_ou_nom.ps1 -nom Usuaris
.\2.crear_ou_nom.ps1 -nom ""
.\2.crear_ou_nom.ps1
```

Amb `-nom` ha funcionat i crea la ou Prova1 dins MusicCloud. Sense `-nom`, nomes amb el valor, tambe ha funcionat i crea la ou Prova2. Si la ou ja existeix dona error i no crea res, i si el nom esta buit o no es posa tambe dona error.

- Crear un script on el nom i la ruta son variables

>📄 [3.crear_ou_nom_ruta.ps1](<Scripts/Unitats organitzatives/Script creacio ou variables/3.crear_ou_nom_ruta.ps1>)

Proves:

```powershell
.\3.crear_ou_nom_ruta.ps1 -nom Prova1 -ruta "OU=MusicCloud,DC=musiccloud,DC=local"
.\3.crear_ou_nom_ruta.ps1 Prova2 "OU=MusicCloud,DC=musiccloud,DC=local"
.\3.crear_ou_nom_ruta.ps1 -nom Prova1 -ruta "OU=MusicCloud,DC=musiccloud,DC=local"
.\3.crear_ou_nom_ruta.ps1 -nom Prova3 -ruta "OU=NoExisteix,DC=musiccloud,DC=local"
.\3.crear_ou_nom_ruta.ps1 "OU=MusicCloud,DC=musiccloud,DC=local" Prova4
```

Amb `-nom` i `-ruta` ha funcionat i crea la ou Prova1 dins MusicCloud, i sense posar els noms (primer el nom i despres la ruta) tambe, crea Prova2. Si la ou ja existeix o la ruta no existeix dona error i no crea res. Si es canvia l'ordre sense posar els noms dona error, perque agafa la ruta com a nom: l'ordre importa.

- Modifica l'script anterior perque l'ordre dels arguments no sigui important.

>📄 [4.crear_ou_ordre.ps1](<Scripts/Unitats organitzatives/Script creacio ou variables/4.crear_ou_ordre.ps1>)

Proves:

```powershell
.\4.crear_ou_ordre.ps1 -nom Prova1 -ruta "OU=MusicCloud,DC=musiccloud,DC=local"
.\4.crear_ou_ordre.ps1 -ruta "OU=MusicCloud,DC=musiccloud,DC=local" -nom Prova2
```

Les dues han funcionat i creen la ou dins MusicCloud, tant si es posa primer `-nom` (Prova1) com si es posa primer `-ruta` (Prova2).

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
