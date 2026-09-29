# Fitxa 2 — Organització del servei de directori de MusicCloud

## Objectiu

En aquesta sessió hem decidit com organitzar els diferents objectes de MusicCloud dins d'un servei de directori.

Aquesta fitxa forma part de la **documentació de disseny del sistema**. Les decisions que hi indiquis s'utilitzaran posteriorment durant la implantació.
# 1. Objectes que hem de gestionar

MusicCloud necessita gestionar de manera centralitzada diferents tipus d'objectes.

Indica quins tipus d'objectes consideres que ha de contenir el servei de directori.

|Tipus d'objecte|Exemples a MusicCloud|
|---|---|
|Usuaris|USR_ACiurans|
|Grups|GR_Administraicó|
|Equips|PC_MAC|
|Servidors|SRV_MAC|
|Comptes d'aplicacions o serveis|SVC_Nom|

Hi afegiries algun altre tipus d'objecte?

    Sí, com hara objectes per movils, portatils, dispositius de xarxa (NAS, SAI, Routers, Switchos)

# 2. Organització mitjançant unitats organitzatives

Proposa les **unitats organitzatives (OU)** principals que utilitzaries a MusicCloud.

|OU|Què contindrà?|Per què la crees?|
|---|---|---|
|Usuaris|Tots els comptes de persones|Tenir-los en un sol lloc i poder aplicar-hi GPO i delegar la gestió.|
|Usuaris / departament|Els usuaris del departament corresponent|Separar-los per departament per aplicar polítiques i delegar la gestió.|
|Usuaris / Externs|Els treballadors externs|Aplicar-hi polítiques més restrictives.|
|Equips|Tots els dispositius informàtics|Aplicar GPO d'equip i organitzar els dispositius.|
|Equips / Clients|Sobretaula, portàtils|Aplicar polítiques diferents segons el tipus d'equip.|
|Equips / Servidors|Els servidors de l'empresa|Tenen polítiques de seguretat i manteniment específiques.|
|Equips / Xarxa|Els dispositius de xarxa (switches, routers, punts d'accés, impressores de xarxa)|Separar-los dels clients i dels servidors, perquè tenen una gestió i una seguretat diferents.|
|Grups|Els grups de seguretat, per exemple un per departament|Separar-los dels usuaris i equips.|
|Comptes de servei|Comptes que fan servir aplicacions o serveis|Controlar-los i auditar-los a part, perquè no són persones.|

## 2.1. Organització dels usuaris

Dibuixa l'estructura que utilitzaries per organitzar els usuaris de MusicCloud.

```text
MusicCloud
│
└── Usuaris
    ├── Direccio
    │   ├── Aina Ciurans
    │   └── Rut Tornil
    │
    ├── Administracio
    │   ├── Dídac Gassó
    │   └── Laia Macias
    │
    ├── Suport_Tecnic
    │   ├── Estel Birosta
    │   ├── Aina Zuriguel
    │   └── Lluïsa Richart
    │
    ├── Produccio_Musical
    │   ├── Roser Alberch
    │   ├── Guillem Adella
    │   ├── Meritxell Reglat
    │   ├── Alícia Monclús
    │   ├── Carles Molins
    │   └── Eulàlia Galcera
    │
    ├── Informatica
    │   ├── Talia Costas
    │   └── Alex Soriano
    │
    └── Externs
        ├── Pere Espinalt
        └── Neus Bages
```

---

# 3. OU o grup?

Indica quina opció utilitzaries principalment en cada cas.

|Necessitat|OU|Grup|
|---|:-:|:-:|
|Organitzar els treballadors d'Administració|x|☐|
|Donar accés a la carpeta d'Administració|☐|x|
|Organitzar els ordinadors clients|☐|x|
|Identificar les persones que participen en Campanya Estiu|x|☐|
|Organitzar els servidors|x|☐|
|Donar privilegis als administradors del sistema|☐|x|
|Organitzar els comptes utilitzats per aplicacions|x|☐|

### Explica amb les teves paraules la diferència principal entre una OU i un grup.

**OU:**

    Una OU ens permet organitzar els diferents elements per poder tenir un control i documentaicó del que tenim. A les OU un element nomes pot estar a un lloc a la begada. 

**Grup:**

    Un Grup ens permet gestionar / donar permisos a un conjunt de elements conjuntament. Un element pot estar env aris grups a la begada.

---

# 4. Un mateix usuari: ubicació i pertinença

Considera aquest cas:

**Dídac Gassó**

- treballa a Administració;
    
- participa en el projecte Campanya Estiu.
    

Indica:

**En quina OU ubicaries el seu compte?**

    A Usuaris / Administració

**A quins grups podria pertànyer?**

    Al grup de G_Administració i al grup de Campanya Estiu

---

### Per què no és contradictori que estigui en una OU però pertanyi a diversos grups?

    Una element dins de una UO no pot estar en cap mes UO pero un element dins de un Grup pot pertanyer a mes grups

---

---

# 5. Servei de directori

Explica breument què entens per **servei de directori**.

    Un servei de directori es un servei que centralitza a tots els dispositius conectats / recursos de la xarxa. Aquest et permet trevallar sobre ells com hara gestionan els seus permisos.

Quin problema resol a MusicCloud?

    Permet organitzar tots els trevalladors i molts dels serveis de xarxa en un sol servidor, tambe esta protegida devant un augment de trevalladors a l'empresa. 

# 6. LDAP

Completa les frases següents.

**LDAP és:**

    LDAP és un protocol que permet representar la empresa (usuaris, grups, equips, etc.) en un directori jerarquic, però no imposa com s'ha d'organitzar. Els serveis de la xarxa (correu, VPN, Git...) el consulten per identificar els usuaris i saber a quins grups pertanyen, i així decidir què poden fer.

**LDAP no és:**

    LDAP no es el programa com a tal, com hara active directory, sino una definició de com hauria de ser aquest i com s'hauria d'organitzar. 

Indica si les afirmacions són certes o falses.

|Afirmació|C|F|
|---|:-:|:-:|
|LDAP és sinònim d'Active Directory|x|☐|
|LDAP permet accedir i consultar informació d'un directori|☐|x|
|OpenLDAP és una implementació d'un servei de directori|x|☐|
|Active Directory utilitza LDAP, entre altres tecnologies|x|☐|

---

# 7. DIT de MusicCloud

Dibuixa la proposta final de **Directory Information Tree (DIT)** de MusicCloud.

Ha de mostrar, com a mínim:

- usuaris;
    
- grups;
    
- equips;
    
- servidors;
    
- comptes d'aplicacions o serveis;
    
- les subdivisions que consideris necessàries.
    

```text
MusicCloud
│
├── Usuaris
│   ├── Direccio
│   │   ├── USR_ACiurans
│   │   └── USR_RTornil
│   ├── Administracio
│   │   ├── USR_DGasso
│   │   └── USR_LMacias
│   ├── Suport_Tecnic
│   │   ├── USR_EBirosta
│   │   ├── USR_AZuriguel
│   │   └── USR_LRichart
│   ├── Produccio_Musical
│   │   ├── USR_RAlberch
│   │   ├── USR_GAdella
│   │   ├── USR_MReglat
│   │   ├── USR_AMonclus
│   │   ├── USR_CMolins
│   │   └── USR_EGalcera
│   ├── Informatica
│   │   ├── USR_TCostas
│   │   └── USR_ASoriano
│   └── Externs
│       ├── USR_PEspinalt
│       └── USR_NBages
│
├── Equips
│   ├── Clients
│   │   ├── PC_...        (sobretaula)
│   │   └── PT_...        (portàtils)
│   ├── Servidors
│   │   └── SRV_...       (fitxers, backups, directori...)
│   └── Xarxa
│       └── NET_...       (switches, routers, punts d'accés, NAS, SAI, impressores)
│
├── Grups
│   ├── GR_Direccio
│   ├── GR_Administracio
│   │   └── GR_Administracio_Caps
│   ├── GR_Suport_Tecnic
│   │   └── GR_Suport_Tecnic_Caps
│   ├── GR_Produccio_Musical
│   │   └── GR_Produccio_Musical_Caps
│   ├── GR_Informatica
│   │   └── GR_Informatica_Admins
│   ├── GR_Externs
│   └── GR_Campanya_Estiu
│
└── Comptes_Servei
    └── SVC_...           (comptes d'aplicacions i serveis, ex.: SVC_Backup)
```

---

# 8. Justificació del disseny

Escull **dues decisions** del teu DIT que consideris importants i justifica-les.

### Decisió 1

    Comptes de servei

**Justificació:**

    Aqui es poden representar les aplicacióons o serveis que necessiten identificar-se en un sistema, com hara un servei de backup que es digui SVC_Backup.
### Decisió 2

    Compte de 

**Justificació:**

---

---

---

# 9. Comprovació final

Respon breument.

### a) Per què no seria una bona idea guardar tots els usuaris, grups, equips i servidors al mateix nivell sense organitzar-los?

---

---

### b) Per què no hauríem d'utilitzar les OU per substituir els grups de permisos?

---

---

### c) Si MusicCloud passa de 14 a 500 treballadors, quina característica del disseny que has fet avui facilitarà més l'administració?

---

---

---

# Documentació final del sistema

A partir de les decisions preses durant la sessió, deixa definida la proposta que utilitzarem inicialment per a MusicCloud.

## Estructura d'unitats organitzatives

```text
MusicCloud
│
│
│
│
```

## Criteri utilitzat per organitzar els objectes

---

---

## Criteri utilitzat per diferenciar OU i grups
