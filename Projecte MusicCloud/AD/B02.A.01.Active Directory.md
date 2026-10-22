# Activitat: del disseny a l’arquitectura d’AD DS

# Context

MusicCloud ja ha completat el disseny lògic del seu servei de directori.  

Abans d’instal·lar Active Directory Domain Services, cal comprovar que l’alumnat identifica correctament els components que s’hauran d’implantar.  

# Identificació dels components

A partir de l’arquitectura prevista, indiqueu:

1.   Quin serà el nom del bosc.  

>musiccloud.local
    
2.   Quin serà el nom del domini.  

>musiccloud.local
    
3.   Quin servidor actuarà com a controlador de domini.

>El servidor d'AD (Windows Server)`SRV-AD-01`
    
4.   Quin servidor proporcionarà DNS.  

>El servidor d'AD (Windows Server) `SRV-AD-01`
    
5.   Quin protocol s’utilitzarà principalment per a l’autenticació.  

>el protocol de kerberos
    
6.   Quin protocol permetrà consultar els objectes.  

>el protocol de ldap
      
7.   7. Quin servei de Windows emmagatzema i administra els objectes del domini?

>el active direcoti al fitxer NTDS.DIT
    

# Anàlisi de l’arquitectura

Responeu breument:

1.   Per què el servidor `SRV-AD-01` necessita una adreça IP fixa?

>Perque es on apunta el dns si aquesta adreça canvia els clients i altres components no es podran conectar. 

2.   Per què els clients del domini han d’utilitzar un servidor DNS capaç de resoldre la zona d’Active Directory?

>Perque aquest apunti al domini del active directory i d'aquesta manera els clients puguin unir-se al domini, autenticarse... 

3.   Què passaria si `SRV-AD-01` estigués apagat?

>Si s'apaga el client podra fer servir el seu dispositiu igualment sempre i quan ja estigues la sessió iniciada.

4.   Per què un únic controlador de domini és acceptable al laboratori però insuficient en una empresa real?

>Poat servir per varies coses com hara el valanceig de carrega repartint el tranzit a els dos servidors, seguretat per si un servidor cau, si s'ha de canviar el component de un servidor o analitzar no cal apagar tota la empresa. 
    
5.   Per què els departaments no s’han creat com a dominis diferents?
    
>Perque la empresa no es suficient gran per necessitaro, si fos una empresa multinaiconal que controla sub empreses amb els seus propis departaments llavors cada sub empresa tindra el seu domini dins el mateix bosc. 


# Planificació de la implantació

Ordeneu les accions següents:

7 - crear els usuaris.  
    
4 - comprovar el DNS.  
    
8 - assignar els usuaris als grups.  
    
2 - instal·lar AD DS.  
    
5 - crear les unitats organitzatives.  
    
1 - preparar la xarxa del servidor.  
    
9 - unir el client al domini.  
    
3 - crear el bosc i el domini.  
    
6 - crear els grups.  
    
10 - comprovar el funcionament del domini.  
    

Justifiqueu breument l’ordre escollit.  

>D'aquesta manera queden ordenat com si fos un arvre de mes gran a mes petit, fent que el primer element no depengui de cap dels altres, el segon depengui del primer etc. 