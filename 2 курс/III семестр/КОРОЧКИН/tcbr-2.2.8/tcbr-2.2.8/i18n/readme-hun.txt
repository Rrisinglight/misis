K�rlek olvasd el ezt, ha k�rd�sed van a programmal kapcsolatban.

Ennek a programnak (TCBR Keretprogram) a c�lja, hogy k�nyveket k�sz�tsen el� a mobilon t�rt�n� elolvas�shoz, a TequilaCat BookReader (K�nyvOlvas�) midlet-et (mobil-alkalmaz�st) haszn�lva.

Ebben a f�jlban a keretprogram le�r�sa tal�lhat�. A BookReader midlet-r�l a program honlapj�t tal�lhatsz tov�bbi r�szleteket �s inform�ci�kat:
http://tequilacat.narod.ru/dev/br/
Javaslom, hogy n�zd meg a honlapot frissebb verzi��rt, amely hibajav�t�ssal �s t�bb funkci�val rendelkezik.

A BookReader keretprogram funkci�i:
1. A keretprogrammal k�sz�tett k�nyvek fejezetekre oszthat�ak, fejezet-fejl�c vagy a maximum fejezetm�ret szerint, amit te hat�rozhatsz meg
2. Sz�mtalan mobiltelefon-m�rka t�mogatott: Nokia, Siemens stb.
3. Egy k�nyv el�k�sz�t�s�n�l bet�t�pust v�laszthatsz, melyet majd a mobilodon olvashatsz. A bet�t�pusok k�z�tt megtal�lhatod a Windows �lland� sz�less�g� bet�t�pusait is.
  Eddig csak az �lland� sz�less�g� bet�t�pusok t�mogatottak, mint a Courier, a k�vetkez� verzi�kban a bet�sz�less�g-ar�nyos bet�k�szletek is el�rhet�ek lesznek.
4. El�- �s h�tt�rsz�nt is v�laszthatsz a m�g k�nyelmesebb olvas�shoz.
5. Sz�mos be�ll�t�si lehet�s�ggel rendelkezhetsz.
6. Ha a keretprogram tartalmaz midlet honos�t�st, d�nthetsz, hogy honos�tod-e a midletet, �gy az �sszes parancs �s men� a telefonos alkalmaz�sodban az anyanyelveden fog megjelenni.

================================================
A BookReader keretprogram haszn�lata:
================================================
1. Nyomd meg a "+" gombot sz�vegf�jl(ok) hozz�ad�s�hoz a k�nyvh�z
2. Nyomd meg a "-" gombot sz�vegf�jl(ok) list�b�l val� elt�vol�t�s�hoz
3. A sz�vegek �tnevez�se az "�tnevez�s" gombbal hajthat� v�gre. Ez a mobilon l�that� sz�veg-feliratokat v�ltozatatja meg.
4. A "Be�ll�t�sok" f�l�n v�laszd ki a verzi�t a telefon-m�rk�dhoz �s t�pusodhoz
5. V�gezd el a k�v�nt be�ll�t�sokat �s m�ret-korl�toz�sokat (l�sd m�g a M�ret-korl�toz�sok r�szben lejjebb)
  A "Kijelz� magass�g�nak kiterjeszt�se" be�ll�t�s csak a Motorola �s a Samsung telefonokn�l alkalmazhat�, a teljesk�perny�s kijelz�s el�r�s�nek �rdek�ben, a kijelz� als� s�vj�nak felhaszn�l�saval, ahol �ltal�ban a men�parancsok jelennek meg a mobilon.
6. A "Bet�t�us" f�l�n v�laszd ki a bet�t�pusokat �s sz�neket. V�laszd a "A mobilod fontja" gombot hogy helyet sp�rolj a sz�veg sz�m�ra (1-2 kilob�jtnyit), ha a telefonod m�ret-megk�t�sekkel rendelkezik (ism�teleten l�sd alant)
7. Az ablak alj�n �rd be a k�nyv nev�t. Ez a n�v a telefonban lesz felhaszn�lva, �gy k�rlek csak �kezetmentes bet�ket (latin ABC bet�i) haszn�lj, �s/vagy sz�mokat,al�h�z�sjeleket (_)
8. V�laszd ki a mapp�t ahova a k�nyvek ker�lnek a "..." gomb megnyom�s�val. Miut�n a k�nyvek elk�sz�ltek, megnyithatod ezt a mapp�t a kiemelt sz�n� el�r�si �tj�ra val� kattint�ssal.
9. Kattints a "Csin�ld !" gombra a k�nyvek elk�sz�t�s�hez

Megjegyz�s: A BookReader midlet csak sz�vegf�jlokat t�mogat. Ahhoz, hogy MS Word f�jlokat olvass, el�sz�r �t kell konvert�lni �ket a Word "Ment�s m�sk�nt..." ("Save As...") men�pontj�val, majd kiv�lasztani a "Csak sz�veg" ("Text format") opci�t.

A program k�nyveket gener�l: n�h�ny JAD �s ugyanannyi JAR f�jlt, sz�muk f�gg a be�ll�t�sokt�l �s a sz�veg m�ret�t�l. Minden k�nyv egy JAD �s egy JAR f�jl p�rosa.

A JAR f�jlok a val�di k�nyvek - mindegyik tartalmazza a sz�vegf�jlokat �s a BookReader midletet. Val�j�ban a JAR f�jlok ZIP arch�vumok .JAR kiterjeszt�ssel, �s b�rmelyik programmal megvizsg�lhat�ak, amelyek t�mogatj�k a ZIP t�m�r�t�st.
A JAD f�jlok r�vid sz�vegf�jlok, melyek le�rj�k a midletet. Alapvet�en mindegyik JAR f�jlnak kell lennie egy megfel� JAD p�rj�nak is, ami le�rja az adatait. N�h�ny telefonnak nincs sz�ks�ge JAD f�jlokra pl. Sony Ericsson T6x0 �s a Motorola Accompli csal�d.

Ha k�szen �llnak a k�nyvek, akkor telep�tsd �ket a mobilodra �s �lvezd az olvas�st.
A midlet telep�t�sr�l tov�bbi r�szleteket a telefonod kezel�si �tmutat�j�ban vagy internetes f�rumokban tal�lhatsz - ilyen t�m�ban rengeteg hozz�sz�l�st tal�lhatsz. N�h�ny t�pus (pl. Nokia 3410) ami nem t�mogat JAVA telep�t�st k�bellel,IRDA-vel vagy BlueTooth-tal, pr�b�ld meg online install�lni, �gy, hogy a k�nyveket el�sz�r felt�lt�d egy WAP oldalra, majd onnan a telefonodra.

====================================
GYIK (Fontos!)
====================================

Mi�rt korl�tozottak a JAR f�jlok �s a fejezetek m�retei?

A mobiltelefonok kis k�sz�l�kek korl�tozott k�pess�gekkel. Egy�b megk�t�sek k�z�tt a mem�ria m�rete sok k�sz�l�kn�l meglehet�sen alacsony. Ennek eredm�nyek�pp korl�toz�sok vannak az alkalmaz�sok m�ret�ben is.

A kis mem�ri�nak k�sz�nhet�en az is ki van k�tve, hogy mekkora sz�vegf�jlt tudunk megnyitni egyszerre. Ha egy fejezet m�rete t�l nagy, akkor a k�sz�l�k vagy nem tudja bet�lteni, �s egy hiba�zenetet dob ki, vagy sz�pen csendesen bet�lti a fejezetet, de annak csak egy r�sz�t.
Hogy kiker�lj�k ezeket a megk�t�seket, a TCBR Keretprogram k�l�nb�z� fejezetm�reteket enged�lyez, ezzel v�ltoztatva a JAR f�jlok m�ret�t.

Probl�m�k �s megold�sok:

Probl�ma:
A JAD �s a JAR f�jlok nem install�lhat�ak a mobilra vagy nem futnak a sikeres telep�t�s ut�n sem (olyan hiba�zenetekkel l�p ki mint ezek: "Alkalmaz�s hiba" ("Application Error"), "A f�jl t�l nagy" ("file too big") stb.)

Megold�s 1:
Az elk�sz�tett JAR f�jl t�l nagy a mobilodhoz - a "Be�ll�t�sok" f�l�n korl�tozd a JAR f�jl m�ret�t.

Megold�s 2:
Rossz midlet verzi�t v�lasztott�l - m�s telefongy�rt�hoz vagy m�s t�pushoz val�t. A telefont�pusok k�l�nb�znek az elt�r� funkci�k t�mogat�s�ban amit a BookReader ny�jt. Egy m�sik t�pusra tervezett BookReader verzi� telep�t�se nagy val�sz�n�s�ggel sikertelen lesz.

Probl�ma:
JAR f�jl sikeresen telep�l �s fut is, de a tartalmazott k�nyvek nem ny�lnak meg. Vagy megny�lnak, de n�h�ny sz�vegr�sz elt�nik (a JAR f�jlokban m�g megtal�lhat�ak)

Megold�s:
A l�trehozott fejezetek t�l nagyok, ahhoz hogy a telefonod mem�ri�ja kezelni tudja �ket. A m�ret-be�ll�t�sokn�l korl�tozd a fejezet-m�retet.

Probl�ma:
Egy csom� fejezet vagy JAR f�jl gener�l�dott.

Megold�s:
A m�reteket kilob�jtban adtad meg (pl. 60) holott b�jtokban kellett volna (ebben az esetben 60000).

Javasolt m�retek n�h�ny telefont�pushoz:

Nokia S40 (Series 40 - ezek a legelterjedtebb Noki�k) - JAR maximum 64000 b�jt, fejezet maximum 60000 b�jt

SonyEricsson T6x0 �s Motorola T720 - A JAR f�jl m�rete nem korl�tozott (vagy 200-300 kilob�jt), maximum fejezetm�ret 120000-150000 b�jt.

Ha a telefonod nincs a fentiek k�z�tt, �s hasonl� probl�m�kkal tal�lkozol, mint a fentebb le�rtak, k�s�rletezz saj�t magad.
Vedd a Nokia m�reteit (maximum JAR m�ret vagy maximum fejezet m�ret, att�l f�gg, milyen jelleg� a probl�ma), �s emeld addig, ameddig a telefonod k�pes azt futtatni.
H�l�s lenn�k (�s m�s Bookreader felhaszn�l�k is) ha elk�lden�d nekem ezeket a m�reteket, hogy szerepelhessenek itt.


A program TequilaCat szerz�i jogv�delme alatt �ll, r�szletek�rt n�zd meg a licence.txt-t.

A program tartalmaz ingyenes programokat (DLL-k�nt):
* FreeImage elj�r�sk�nyvt�r
* infozip' zip elj�r�sk�nyvt�r
* ZipBuilder elj�r�sk�nyvt�r az infozip' -re �p�tve
K�sz�net a szerz�knek, a licenc inform�ci�t hamarosan mell�kelem.
