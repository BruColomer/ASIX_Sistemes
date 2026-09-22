# Fitxa 1 — Anàlisi inicial de MusicCloud

**Nom i cognoms:** Bru Colomer  
**Data:** 9/17/2026  


## Objectiu

MusicCloud necessita reorganitzar la seva infraestructura informàtica. Abans d'instal·lar o configurar cap servei, cal entendre:

- qui treballa a l'empresa;
    
- quines funcions té cada persona;
    
- quins recursos existeixen;
    
- qui necessita accedir a cada recurs;
    
- com podem gestionar aquests accessos de manera eficient.
    

---

# 1. Conèixer MusicCloud

Consulta la informació disponible sobre els departaments, treballadors i perfils d'usuari de MusicCloud.

Completa la taula següent.

|Persona|Departament|Funció / responsabilitat|Necessita privilegis especials? Per què?|
|---|---|---|---|
|Aina Ciurans|Direcció|Usuari administrador dels altres departaments||
|Rut Tornil|Direcció|Usuari administrador dels altres departaments||
|Dídac Gassó|Administraicó|Usuari adminitrador||
|Laia Macias|Administraicó|Cap de departament usuari administrador del departament.|Persmisos per administrar tot el departament|
|Estel birosta|Suport tècnic|Usuari standard|Permisos suficients per poder administrar carpetes especifiques per poder donar suport.|
|Aina Zuriguel|Suport tècnic|Usuari standard|Permisos suficients per poder administrar carpetes especifiques per poder donar suport.|
|Lluïsa Richart|Suport tècnic|Cap de departament usuari administrador del departament.|Persmisos per administrar tot el departament|
|Roser alberch|Producció musical	|Usuari standard||
|Guillem Adella|Producció musical	|Usuari standard||
|Meritxell Reglat|Producció musical	|Cap de departament usuari administrador del departament.|Persmisos per administrar tot el departament|
|Alícia Monclús|Producció musical	|Usuari standard||
|Carles Molins|Producció musical	|Usuari standard||
|Eulàlia Galcera|Producció musical	|Usuari standard||
|Talia Costas|Informàtica|Cap de departament usuari administrador del departament.|Persmisos per administrar tot el departament i poder administar la resta de departaments (no cal veure el contingut) mes sino les carpetes|
|Alex Soriano|Informàtica|Usuari administrador|poder administar la resta de departaments (no cal veure el contingut) mes sino les carpetes|


### 1.1. Reflexió

Quines diferències observes entre un **treballador**, un **departament** i una **funció o responsabilitat**?

    Un treballador es la persona individual, el departament es el conjunt de trevalladors que trevallen en un mateix ambit, i la funció o responsabilitat es la tasca que te que fer cada trevallador.

Hi ha persones que, pel seu càrrec o funció, necessiten accessos diferents dels altres membres del seu departament?

x Sí  
☐ No

Posa'n algun exemple:

    si, els caps de departament han de poder accedir a tots els recursos del departament, i tenir els permisos sobre aquests. 

# 2. Recursos de l'empresa

Analitza l'estructura d'informació de MusicCloud.

Classifica alguns dels recursos següents segons la seva finalitat.

|Recurs|Qui creus que l'hauria d'utilitzar?|Per a què?|
|---|---|---|
|`/empresa/comu/intercanvi`|(compartida entre tots) (lectura i escritura a thotom)|Perque aquesta carpeta es fara servir per tots els trevalladors i entre tots els trevalladors per compartir carpetes.|
|`/empresa/comu/comunicats`|(cap department i direcio escritura i lectura externs no lectura)|Son comunicats, no hi ha interes en els trevalladors per modificar-ho, nomes direcció sol publicar comunicats o els mateixos caps.|
|`/empresa/departaments/administracio/compartida`|(lectura i escritura direcció lectura informatics poder gestionar la carpeta pero no veure contingut)|Aquest estil de carpetes els trevalladors tindran lectura i escritura i direcció tindra access a lectura.|
|`/empresa/departaments/administracio/gestio_departament`|(cap de departament lectura i escritura)|El cap tindra lectura i escritura|
|`/empresa/projectes/campanya_estiu`|(es un nom mol generic per la qual cosa no ho se)||
|`/empresa/administracio_sistema/backups`|(Els informatics lectura i escritura)|Perque no podem donar access a la informaicó que hi pot haber a els backups a tots els trevalladors, si s'en necesita un es comunica als informatics i aquest s'encarreguen de recuperar la informaicó.|

---

# 3. Qui ha de poder fer què?

Per a cada situació, indica quin nivell d'accés consideres adequat.

Utilitza:

- **NA** → sense accés
    
- **L** → lectura
    
- **L/E** → lectura i escriptura
    
- **ADM** → administració
    

No busquis encara una solució tècnica. Pensa només en les necessitats de l'empresa.

|Situació|Accés proposat|Justificació|
|---|---|---|
|Dídac accedeix a la carpeta compartida d'Administració|ADM|Crec que els administradors necesiten permisos a tot|
|Laia accedeix a la gestió del departament d'Administració|ADM|es la cap de departament ha de tenri accessos adm|
|Pere, treballador extern, accedeix als comunicats interns|L|No cal que crei nous comunicats|
|Talia accedeix als backups del sistema|ADM|estaria ve pero que nomes pugues gestionar tot pero no llegir|
|Un membre de Producció musical accedeix a la carpeta d'Administració|NA|No hi ha de fer res|
|Un participant de `campanya_estiu` accedeix als fitxers del projecte|L/E|depenent del participant tindra lectura o no|

---

# 4. Primer problema: com assignem els permisos?

Imagina que MusicCloud té només quatre treballadors:

- Anna
    
- Biel
    
- Carla
    
- David
    

Tots quatre treballen al mateix departament i necessiten accedir a la mateixa carpeta.

Una possible solució seria configurar:

```text
Anna  → lectura/escriptura
Biel  → lectura/escriptura
Carla → lectura/escriptura
David → lectura/escriptura
```

### 4.1.

Què passaria si l'empresa tingués **100 treballadors** amb el mateix tipus d'accés?

Es tardaria molt en configurar-los i no hi hauria control de permisos minims per els trevalladors, podrien surgir problemes amb els trevallador accedint a carpetes amb informaicó restringuda o modificar aquestes mateixes. 

### 4.2.

Què passaria cada vegada que s'incorporés una persona nova?

S'ahuria de assingar-li els permisos a totes les carpetes.

### 4.3.

Què passaria quan una persona canviés de departament?

Manualment s'auria de configurar a aquesta persona els permisos a les carpetes corresponents de aquest nou departament

### 4.4.

Proposa una manera de gestionar aquestes persones conjuntament.

No cal que coneguis encara el nom tècnic de la solució.

Es pot fer per grups fent un grup departament i dins el grup departament posar-hi tots els trevalladors, dins aquest grup tambe hi hauria el group cap departament on hi haura el cap d'aquest (que necesita permisos mes elevats)

# 5. Canvis a MusicCloud

Ara es produeixen aquests tres canvis:

### Cas A

Dídac deixa Administració i passa a Producció musical.

Quins accessos hauria de perdre?

manualment treure els seus permisos a totes les carpetes de adminsitració.

Quins accessos hauria d'obtenir?

Es don manualment tots els accessos a les carpetes de producció musical 

### Cas B

S'incorpora una nova treballadora al departament d'Administració.

Quins accessos caldria configurar?

Es ba a totes les carpetes de administraicó i es configura manualment a cada una els permisos corresponents.

### Cas C

Pere Espinalt deixa de col·laborar amb MusicCloud.

Què hauríem de fer amb els seus accessos?

Treure els permisos a totes les carpetes on ell tenir permisos.

# 6. Busquem una solució millor

Suposa ara que podem crear conjunts de persones que comparteixen unes mateixes necessitats d'accés.

Per exemple:

```text
Administració
    ├── Dídac
    ├── Laia
    └── Roser
```

I podem donar permisos directament al conjunt:

```text
Administració → carpeta_administracio → L/E
```

### 6.1.

Quin avantatge té aquesta solució respecte a donar permisos persona per persona?

Els permisos a les carpetes nomes s'ha de configurar un cop, un cop esta fet es tan facil com afegirla al departament corresponent. 

### 6.2.

Si Dídac passa d'Administració a Producció musical, què caldria modificar?

S'el cambia de departament

### 6.3.

Com anomenaries aquests conjunts de persones?

---

---

# 7. Primera proposta per a MusicCloud

A partir de l'organització de l'empresa, proposa els primers conjunts de persones que crearies.

**No cal trobar encara la solució definitiva.**

|Nom proposat|Qui hi pertanyeria?|Per què existeix aquest conjunt?|
|---|---|---|
||||
||||
||||
||||
||||

---

# 8. Cas que complica el model

Laia treballa al departament d'Administració, però també és la responsable del departament.

És suficient que pertanyi només al conjunt `Administració`?

☐ Sí  
☐ No

Per què?

---

---

Quina possible solució proposes?

---

---

---

# 9. Un altre cas

Diverses persones de departaments diferents participen temporalment en el projecte:

```text
Campanya Estiu
```

Creus que hauríem de canviar-les de departament?

☐ Sí  
☐ No

Si no, com podríem donar-los accés als recursos del projecte?

---

---

---

# 10. Conclusions

Completa les frases amb les teves paraules.

### Usuari

Un usuari representa:

---

### Recurs

Un recurs és:

---

### Permís

Un permís determina:

---

### Grup

Un grup serveix per:

---

---

# 11. Regla de mínim privilegi

Analitza aquesta afirmació:

> Un usuari només hauria de tenir els permisos estrictament necessaris per realitzar la seva feina.

Explica amb les teves paraules què significa.

---

---

Posa un exemple relacionat amb MusicCloud.

---

---

---

# 12. Pregunta final

Imagina que demà MusicCloud passa de 14 treballadors a 500.

Quina de les dues estratègies consideres més adequada?

☐ Assignar permisos individualment a cada usuari.

☐ Organitzar els usuaris segons les seves necessitats i assignar permisos a aquests conjunts.

Justifica la resposta.

---

---

---

Jo **no faria obligatori que acabessin tota la fitxa abans d'explicar res**. La utilitzaria de manera sincronitzada amb la classe:

**0–40 min:** apartats 1–3 → analitzen MusicCloud i els accessos.  
**40–65 min:** apartats 4–5 → apareix el problema de gestionar permisos individualment.  
**65–85 min:** explicació curta de **usuari, grup, recurs, permís i mínim privilegi**.  
**85–110 min:** apartats 6–9 → apliquen immediatament el concepte de grup.  
**110–120 min:** apartats 10–12 → revisió i tancament.

Hi ha una decisió pedagògica important: a l'apartat 4 **no utilitzo la paraula “grup” fins que l'alumnat ha intentat resoldre el problema**. Això encaixa molt millor amb el cicle que vols seguir: primer tenen el problema, després apareix la necessitat i només aleshores introdueixes el concepte teòric.
