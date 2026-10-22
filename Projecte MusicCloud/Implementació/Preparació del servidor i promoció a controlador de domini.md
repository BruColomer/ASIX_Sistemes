# Pràctica

## Objectiu

Preparar el servidor `SRV-AD-01` i promocionar-lo com a primer controlador de domini del domini `musiccloud.local`.
## Escenari

L’empresa **MusicCloud** vol iniciar la implantació d’Active Directory Domain Services.

El servidor Windows Server que s’utilitzarà com a controlador de domini serà:
```text
SRV-AD-01
```
El domini que es crearà serà:
```text
musiccloud.local
```
Aquest servidor també proporcionarà el servei DNS del domini.
## Tasques

### Part 1. Configuració inicial del servidor

Configureu el servidor perquè compleixi els requisits següents:

| Element           | Valor              |
| ----------------- | ------------------ |
| Nom del servidor  | `SRV-AD-01`        |
| Adreça IP         | fixa               |
| DNS preferit      | el mateix servidor |
| Connexió de xarxa | operativa          |
| Zona horària      | correcta           |
| Hora del sistema  | correcta           |
La configuració IP concreta dependrà de la xarxa del laboratori. Anoteu els valors utilitzats.

Completeu la taula següent:

| Paràmetre        | Valor configurat |
| ---------------- | ---------------- |
| Adreça IP        | `10.0.2.10`     |
| Màscara          | `255.255.255.0`  |
| Porta d’enllaç   | `10.0.2.1`   |
| DNS preferit     | `10.0.2.10`    |
| Nom del servidor | `SRV-AD-01`   |

### Part 2. Instal·lació del rol AD DS

Localitzeu i utilitzeu el procediment adequat per instal·lar el rol AD DS i promocionar el servidor a controlador de domini. Documenteu breument les comandes o passos utilitzats.

>executem la seguent comanda per instalar el rol de AD DS
>![Instal·lació del rol AD DS](<img/Preparació del servidor i promoció a controlador de domini_img/02_Instalacio_rol_AD_DS.png>)
>![Resultat de la instal·lació](<img/Preparació del servidor i promoció a controlador de domini_img/02_Resultat_instalacio_rol_AD_DS.png>)

### Part 3. Promoció a controlador de domini
Promocioneu el servidor a controlador de domini amb les opcions següents:

| Opció                                  | Valor              |
| -------------------------------------- | ------------------ |
| Tipus d’implantació                    | Crear un nou bosc  |
| Nom del domini arrel                   | `musiccloud.local` |
| Servidor DNS                           | Sí                 |
| Catàleg global                         | Sí                 |
| Nom NetBIOS                            | `MUSICCLOUD`       |
| Controlador de domini de només lectura | No                 |
| Reinici final                          | Sí                 |

Definiu una contrasenya segura per al mode de restauració de serveis de directori.

>![Promoció a controlador de domini](<img/Preparació del servidor i promoció a controlador de domini_img/03_Promocio_controlador_domini.png>)

### Part 4. Verificació

Després del reinici, comproveu:

1. Que el servidor s’anomena `SRV-AD-01`.

>![Nom del servidor](<img/Preparació del servidor i promoció a controlador de domini_img/04_Nom_servidor.png>)

2. Que el domini `musiccloud.local` existeix.

>![Domini musiccloud.local](<img/Preparació del servidor i promoció a controlador de domini_img/04_Domini_existeix.png>)

3. Que el servidor és controlador de domini.

>![Controlador de domini](<img/Preparació del servidor i promoció a controlador de domini_img/04_Controlador_de_domini.png>)

4. Que el servei DNS està instal·lat.

>![DNS instal·lat](<img/Preparació del servidor i promoció a controlador de domini_img/04_DNS_instalat.png>)

5. Que el DNS resol correctament el domini.

>![Resolució DNS](<img/Preparació del servidor i promoció a controlador de domini_img/04_Resolucio_DNS.png>)

Completeu la taula següent. Adjunta la comanda que has utilitzat per a cada una de les comprovacions.

| Comprovació                          | Resultat |
| ------------------------------------ | -------- |
| Nom del servidor                     | `SRV-AD-01` (`hostname`) |
| IP fixa configurada                  | `10.0.2.10` (`Get-NetIPConfiguration`) |
| AD DS instal·lat                     | `Installed` (`Get-WindowsFeature AD-Domain-Services`) |
| Domini creat                         | `musiccloud.local` (`(Get-WmiObject Win32_ComputerSystem).Domain`) |
| DNS instal·lat                       | `Installed` (`Get-WindowsFeature DNS`) |
| Resolució de `musiccloud.local`      | `10.0.2.10` i `192.168.56.10` (`Resolve-DnsName musiccloud.local`) |
| Eines d’Active Directory disponibles | Mòdul `ActiveDirectory` (`Get-Module -ListAvailable ActiveDirectory`) |

## Preguntes

Responeu breument:

1. Per què `SRV-AD-01` necessita una IP fixa?
    
2. Per què és necessari DNS en un domini Active Directory?
    
3. Quina diferència hi ha entre instal·lar AD DS i promocionar el servidor a controlador de domini?
    
4. Quin és el nom del domini creat?
    
5. Quin és el nom NetBIOS del domini?
    
6. Per què no és recomanable que els clients del domini utilitzin un DNS extern com a DNS principal?
    

