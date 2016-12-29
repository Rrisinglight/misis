Pros�m pre�itaj si toto ak m� ot�zky oh�adom programu.

��elom tohoto programu (TCBR Shell) je vytvori� knihy �itate�n� na mobiln�ch telef�noch, s pou�it�m TequilaCat BookReader midlet-u.

Ni��ie, je pop�san� prostredie programu. Bli��ie inform�cie a detaily o samotnom midlet-e BookReader-u n�jde� na domovskej str�nke programu:
http://tequilacat.narod.ru/dev/br/
Odpor��am skontrolova� �i sa na web str�nke programu nenach�dza nov�ia verzia, s viacer�mi vlastnos�ami odstr�nen�mi chybami.

Prostredie BookReader-u umo��uje:
1. Knihy vytvoren� t�mto prostred�m m��u by� rozdelen� do �ast�, na z�klade ��sla kapitoly alebo by maximalej ve�kosti ktor� si zvol�
2. R��y zna�ky mobiln�ch telef�nov s� podporovan�: Nokia, Siemens at�.
3. Ke� vytv�ra� knihu, m��e� si zvoli�p�smo ak� sa bude zobrazova� na displey-i, zo v�etk�ch nain�talovan�chp�sem vo Windows-e.
  Zatia� s� podporovan� iba �tandardn� p�sma ako Courier, v da���ch verzi�ch bud� pr�stupn� aj propor�n� p�sma.
4. M��e� si zvoli� farbu pozadia a p�sma, pre lep�iu �itate�nos�.
5. M��e� si zvoli� z nieko�k�ch nastaven� pre ��tanie.
6. Ak prostredie obsahuje lokaliz�ciu midlet-u , m��e� localizova� midlet, tak aj v�etky pr�kazy a menu v aplik�cii telef�nu bud� zobrazen� v tvojom rodnom jazyku.

================================================
Ako pou��va� prostredie BookReader-u:
================================================
1. Stla� tla�idlo "+" na pridanie textov�ho s�boru(ov) ktor� chce� prida� do knihy
2. Stla� tla�idlo "-" na odstr�nenie textov zo zoznamu
3. Premenuj texty pou�it�m tla�idla "Premenuj" na zmenu n�zvov ktor� bude� vidie� v telef�ne
4. V z�lo�ke "Nastavenia", zvo� verziu zodpovedaj�cu v�robcovy tvojho telef�nu a modelu
5. Zvo� po�adovan� nastavenia a obmedzenia ve�kosti (viac si pre��taj o obmedzeniach ve�kosti ni��ie)
  Nastavenie "Zme� ve�kos� obrazovky o" je pou�i�e�n� iba u telef�nov Motorola a Samsung , na povolenie celoobrazovkov�ho zobrazenia pou�it�m hustej�ieho riadkovania obrazovky kde sa oby�ajne zobrazuj� pr�kazy.

6. V z�lo�ke "P�sma", zvo� p�smo a farby. Vyber "Pou�i p�smo telef�nu" na vyu�itie priestoru pre knihy (1-2 kilobytes textu), ak tvoj telef�n m� obmedzenie ve�kosti (op�, pozri ni��ie)
7. Nap� meno knihy na spodku okna. Toto meno bude pou�it� v telef�ne, tak pou�i pro�m len p�smen� latinka, ��sla a podtr��tka.
8. Zvo� adres�r do ktor�ho bud� vygenerovan� knihy, stla�en�m tla�idla "...". Ke� vytvor� knihy, m��es otvori� tento adres�r kliknut�m na jeho zv�raznen� cestu.
9. Klikni "Vytvor!" na vytvorenie kn�h

Zapam�taj si pros�m: Midlet BookReader-u podporuje iba textov� s�bory. Na ��tanie s�borov MS Word-u mus� ich  najsk�r skonvertova� do textov�ho form�tu, t�m �e ich ulo�� pou�it�m "Ulo� ako..." a zvol� "Text form�t"

Tento program generuje knihy: p�ry s�borov JAD a JAR, ich po�et z�vis� na zvolen�ch nastaveniach a ve�kosti textu. Ka�d� kniha je tvoren� p�rom JAR a JAD s�borov.

JAR s�bor obsahuje knihy - ka�d� obsahuje textov� s�bory a midlet BookReader-u. V podstate JAR s�bory s� ZIP arch�vy s pr�ponou .JAR, a m��u by� prezeran� ak�mko�vek archiva�n�m programom podporuj�cim ZIP kompresiu.
JAD s�bory s� kr�tke textov� s�bory popisuj�ce midlety. V�eobecne ka�d� JAR s�bor by mal ma� rovnak� JAD s�bor ktor� popisuje jeho vlastnosti. Niektor� telef�ny nepotrebuj� JAD s�bory, napr. SE T6x0 a Motorola Accompli.

Po vytvoren� kn�h, nahraj ich do telef�nu a m��e� za�a� ��ta�.
Viac detailov ako nahra� vytvoren� midlety (.jar s�bory) z�ska� v manu�ly svojho mobiln�ho telef�nu alebo internetov�ch f�rach - tu je dostatok dostatok inform�ci� na t�to t�mu. Pre niektor� modely (napr�klad Nokia 3410) ktor� nepodporuj�  priame nahr�vanie Java midletov prostredn�ctvom k�bla, IRDA alebo BlueTooth, je st�le mo�nos� nahra� ich vzduchom cez WAP, tu ale mus� vygenerovan� knihy uploadn�� najprv na WAP str�nku.

====================================
FAQ (D�le�it�!)
====================================

Pre�o obmedzova� ve�kos� JAR s�borov a textov�ch dokumentov?

Mobiln� telef�ny s� mal� zariadnia s obmedzen�mi mo�nos�ami. Na margo ostatn�ch re�trikci�, ve�kos� pam�te t�chto zariaden� je niekedy moc mal�. Ako re�trikciu, v�robcovia mobiln�ch telef�nov limituj� maxim�lnu ve�kos� aplik�ci�.

Takisto kv�li malej pam�te, s� obmedzenia aj vo ve�kosti jednor�zovo otv�ran�ho textu. Ak je jedna jeho �as� pr�li� ve�k�, telef�n ju nedok�e otvori�, Bu� sa zobraz� chyba, alebo sa nahr� nekompletn� text.

Na ob�denie t�chto re�trikci�, TCBR Shell umo�nje rozdeli� text do jednotliv�ch �ast�, �o m� vpliv na ve�kos� JAR s�boru.

Tak�e, ak m� nasleduj�ce probl�my:

Probl�m:
JAD a JAR s�bory sa nedaj� nahra� do telef�nu, alebo nem��u by� spusten� po �spe�nom nahrat� (s chybami ako napr�klad "Chyba aplik�cie", "s�bor prive�k�" at�.)

Rie�enie 1:
vytvorn� JAR s�bor je pr�li� ve�k� pre tvoj telef�n - pros�m obmedz ve�kos� JAR s�boru v z�lo�ke "Nastavenia".

Rie�enie 2:
Vybral si si zl� verziu midletu - od in�ho v�robcu mobiln�ho telef�nu, alebo pre in� model telef�nu. Modely telef�nov sa odli�uj� v podpore r�znych nastaven� pou�it�ch bookreaderom. In�talovanie verzie bookreaderu vytvoren�ho pre in� model v��inou havaruje.

Probl�m:
JAR s�bor sa �spe�ne nahr� a be��, ale obsiahnut� knihy nem��u by� otvoren�. Alebo, knihu je mo�n� otvori� ale �as� textu sa strat� (v porovnan� s textom ktor� m��e� n�js� obsiahnut� v JAR arch�ve)

Rie�enie:
Generovan� �asti s� pr�li� ve�k� aby sa zmestili do pam�i tvojho telef�nu. Pros�m zmen�i ve�kos� �ast� textu v nastaveniach.

Probl�m:
Je generovan� ve�k� mno�stvo textov v JAR s�bore, alebo ve�a JAR s�borov.

Rie�enie:
�pecifikoval si ve�kos� v kilobytoch (napr. 60) ale ve�kos� mus� by� v bytoch (v tomto pr�pade je spr�vne, 60000).

Doporu�en� ve�kosti pre niektor� telef�ny s�:

Nokia S40 (Je ve�k� mno�stvo Nokia telef�nov) - JAR max 64000, Text max 60000

SonyEricsson T6x0 a Motorola T720 - ve�kos� JAR sa zd� by� neobmedzen� (alebo 200-300 kb), max ve�kos� textu je 120000-150000.

Ak tu nie je uveden� tvoj telef�n, a spozoruje� probl�my, vysk��aj s�m in� ��sla.
Pou�i ve�kosti pre Nokiu (max JAR ve�kos� alebo max ve�kos� textu v z�vyslosti ak� m� probl�m), vysk��aj a n�jdi �o ti bude vyhovova�.
Budem opatrn� (a ostatn� pou��vatelia Bookreaderu tie�) ak mi po�le� tieto ve�kosti aby som ich tu uviedol.



Tento program je pod ochrannou zn�mkou TequilaCat, pozri detaily license.txt.

Pou�it� ostatn� free software (ako DLL):
* FreeImage kni�nice
* infozip' zip kni�nice
* ZipBuilder kni�nice s��as�ou infozip' zip kni�n�c
�akujem ich autorom, �oskoro prid�m licen�n� info.
