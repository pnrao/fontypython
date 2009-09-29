��    �      �  �   L	      `  $   a  Y   �  R   �     3  p  O     �     �     �  2   �     2     9     F     ^     d  
   j     u  
   �     �  .   �  :   �  "        ;  ?   P     �     �     �     �     �     �     �  *     /   B     r     �     �     �     �  +   �     �  #        4     M  
   d     o  �   �          -     3  "   ;     ^  0   f  .   �  '   �     �  >   �     :     R  #   p     �  �   �  e   k     �  �  �     v  ;   �     �     �     �  C        G     ]     e     w  �  �  ^   �      �   0   �   !   !  n   :!  �   �!     �"  	   �"     �"  J   �"     �"  �   �"  1   �#     '$  J   ?$     �$  2   �$     �$     �$  $    %     %%     ;%     @%     L%     X%     j%  -   �%     �%     �%      �%     �%  5   &     8&  !   V&     x&  s   �&  w   �&  &   m'  0   �'  1   �'     �'     (     (  �
  (  3   �2  H   3     b3  I   {3     �3  +   �3     4     *4  A   A4     �4     �4     �4     �4  -   �4  G   5  8   Z5     �5  E   �5     �5     �5  "   6  (   $6  2   M6  #   �6  :   �6  (   �6     7  �   '7  �  �7  '   79  c   _9  \   �9      :  �  ::     (@     8@     M@  <   f@     �@     �@     �@     �@     �@  
   �@      �@  
   A     )A  5   <A  C   rA  #   �A     �A  3   �A     %B     8B     UB  "   aB      �B     �B     �B  ;   �B  5   C     DC     RC     cC  %   uC     �C  (   �C     �C  1   �C     #D     ;D     QD  !   ^D  v   �D  "   �D     E     !E      )E     JE  :   SE  B   �E  @   �E     F  C   F     cF  #   }F  .   �F  	   �F  �   �F  �   �G     7H  �  NH  "   J  6   %J     \J     sJ     �J  I   �J  5   �J     K     K     &K  "  9K  t   \O  	   �O  A   �O     P  �   ;P  %  �P     �Q     �Q     R  U   R     nR  �   �R  ?   �S     �S  D   �S     *T  9   JT     �T  
   �T  +   �T     �T     �T     �T     �T     U  "    U  %   CU     iU     ~U  +   �U     �U  ;   �U  "   V  &   (V     OV  �   \V  �    W  )   �W  6   �W  =   X     NX     [X     lX  A  sX  8   �c  U   �c     Dd  [   ]d     �d  #   �d     �d     e  M   &e     te  (   �e     �e     �e  3   �e  c   f  R   }f     �f  L   �f      -g  
   Ng  %   Yg  -   g  -   �g  &   �g  @   h  8   Ch     |h  �   �h                   R      8                       J   y   h   >       ?   T                  V   <   �   i   I   +      N      �   3   �   9   p   �             �   �           �      O   d   A   S       u   B   E           Q   X       '          C       %   �       -                     b   ,   �   Y           x   )   Z   �      0   v   ~                       7   }      ^   *   :   l   g   �   (          a       P       e   �       K   1   5   |   m       /   @       �   �   c          $   o       M      �   L   j       q   6      z       G   k       #   U   4          �   .       [   ]           {      `          !          D          s       �   F   W          n   H   w   "   2   =   t   _   r   �   ;               	   �      �   \   &   f   
    
(Also check your file permissions.) 
Couldn't make the .fonts folder in %s
Please check your write permissions and try again. 
Couldn't make the folder in %s
Please check your write permissions and try again.  * indicates installed pogs %(c)s [OPTIONS] [VIEW] [TARGET]
VIEW   : A place where fonts are. (A Pog or a Folder.)
TARGET : A "pog". A place to keep those fonts.

("%(c)s" on it's own will start the GUI.)

NB: Try not to use spaces in pog names. If you must, 
then "quote the name."

Please use -e to see more info.

NEWS : We now support TTF, OTF, Type1 (PFB, PFA) 
and TTC fonts.

%(version)s

The basic idea:
===============
Many designers have collections of font files in big
directory structures or on other media. Fonty Python
will let you gather your fonts and structure them
into collections -- or what I call "pogs" -- a place
to keep tyPOGraphy. Well, why not?

Your fonts never move from where they are
(so don't worry). All that happens is that you select 
fonts visually and place their names into a pog,
then you install or uninstall pogs as you need them.
No copies of your fonts are made, only links to the
original files are used to install the fonts.

For example, you might have a pog called "logos"
into which you place all the ttfs you have of
company logos. After that, when you need to work
with those logos, you simply install the 'logos' pog
and start your design app!

FP is also great for just looking at fonts wherever
they are on your computer, without having to install
them system-wide.

Manage your fonts on Gnu/Linux!
===============================
%(copy)s

%(warranty)s

%(contact)s
 %s already exists. %s has been purged. %s has not been purged. %s takes two arguments: SOURCE(folder) TARGET(pog) &About &Check fonts &Clear ENTIRE selection &Exit &Help &Purge Pog &Select ALL the source fonts &Selection &Settings	Ctrl+S (%s) cannot be found. Try -l to see the names. (%s) skipped. I can't display this name under your locale. (%s) skipped. It's an invalid pog. (Check your filter!) A Pog with no name won't be created, however it was a good try! About About FontyPython Are you sure? Bad voodoo error. I give up. Cannot delete the Pog.%s Change settings Check for dangerous fonts. Checking fonts, this could take some time. Choose a directory and double click it to start Choose some fonts Clear filter Clear selection Clear the selection completely. Close the app Copying fonts from %(source)s to %(target)s Could not open (%s). Could not write to the config file. Creates a new, empty Pog Creating a new pog: %s Delete Pog Deselects any chosen pogs. Do you want to purge %s?

Purging means all the fonts in the pog
that are not pointing to actual files
will be removed from this pog. Enter a name for the new pog Error Filter: Find those fonts that crash Fonty. Folders Font cannot be found, you should purge this Pog. Font causes a memory error, it can't be drawn. Font may be bad and it cannot be drawn. Fonty Python Fonty Python - view and manage all kinds of fonts on Gnu/Linux Fonty Python version %s Fonty Python, um ... crashed. Fonty Python: bring out your fonts! H&elp	F1 I am sorry, but Unicode is not supported by this installation of wxPython. Fonty Python relies on Unicode and will simply not work without it.

Please fetch and install the Unicode version of python-wxgtk. I can't decode your argument(s). Please check your LANG variable. Also, don't paste text, type it in. I can't find %s I cannot find "python-imaging"
Please install this package.

TIP
===
On my distro I can search for it like this:
aptitude search python-imag
This returns many results, one of which is:
python-imaging
I then install it like this:
sudo aptitude install python-imaging

Make sure it's at least version 1.1.6-1

You can also get the latest version from here:
http://www.pythonware.com/products/pil/index.htm
 I could not find any bad fonts. I have placed %(count)s fonts from %(folder)s into %(pog)s. Include sub-folders. Install Pog Installing (%s) Installs all selected Pogs.
Use SHIFT/CTRL+Click on the list above. Jump the lazy dog fox Licence Listing %d pog(s) Looking in %s... Manage your fonts on Gnu/Linux.
NEWS : We now support TTF, OTF, Type1 (PFB, PFA) 
and TTC fonts.

Many designers have collections of font files in big
directory structures or on other media. Fonty Python
will let you gather your fonts and structure them
into collections -- or what I call "Pogs" -- a place
to keep tyPOGraphy. Well, why not?

Your fonts never move from where they are
(so don't worry). All that happens is that you select 
fonts visually and place their names into a Pog,
then you install or uninstall Pogs as you need them.
No copies of your fonts are made, only links to the
original files are used to install the fonts.

For example, you might have a Pog called "logos"
into which you place all the ttfs you have of
company logos. After that, when you need to work
with those logos, you simply install the 'logos' Pog
and start your design app!

FP is also great for just looking at fonts wherever
they are on your computer, without having to install
them system-wide.
	
	%(copy)s
	%(contact)s
	 NB: If you wanted to use spaces in a pogname or folder then please put "quotes around them."   New Pog No config file found, creating it with defaults. No supported fonts found there... Not a single font in this pog could be installed.
The original font folder has probably moved or been renamed. Not a single font in this pog could be uninstalled.
None of the fonts were in your fonts folder, please check your home .fonts (with a dot in front) folder for broken links.
The pog has been marked as "not installed". Nothing to do Oh boy... Oh dear, One or more selected fonts is installed, fix your selection and try again. Page length: Please check your arguments, there seem to be too many.
(Remember: it's one pound for a five-minute argument, but only eight pounds for a course of ten.)

NB: If you wanted to use spaces in a pogname or folder then please put "quotes around them."  Please choose a Pog or a Font folder on the left. Please choose a Source. Please restart Fonty Python after you have moved:"%s" to some other place. Please use a number for %s Pog cannot be written to.
Check your filesystem.%s Pog is already installed. Pog is empty. Pog is invalid, please hand-edit it. Pog is not installed. Pogs Point size: Purge font? Put fonts into %s Remove %s, are you sure? Remove all ghost fonts from the selected Pog. Remove fonts from %s Removing (%s) SORRY: UNICODE MUST BE SUPPORTED Sample text: Select ABSOLUTELY ALL the fonts in the chosen source. Selected fonts are now in %s. Selected fonts have been removed. Settings Some fonts could not be uninstalled.
Please check your home .fonts (with a dot in front) folder for broken links.%s Some fonts did not install.
Perhaps the original fonts folder has moved or been renamed.
You should purge or hand-edit. Sorry, (%s) does not exist. Try --list Sorry, can't find (%s). Try -l to see the names. Sorry, only Gnu/Linux is supported at the moment. Starting in %s: Target Pogs Thanks The basic format is:
%(c)s [VIEW] [TARGET]
  VIEW   = A place where fonts are. A pog or a folder
		   someplace.
  TARGET = A pog, a place to keep references to fonts
		   If you don't include a target then you are
		   viewing/editing only.

Tips:
=====
* Don't use spaces in pog names. If you absolutely
  must then use quotes around the name, e.g. "Pogs
  of Ni"
* If your design apps (for example The Gimp) do not
  reflect the fonts that you have installed, restart
  the app. Sometimes the system needs a while to
  reflect the new fonts in your fonts folder.

Examples: All using short options, see -h
=========
%(c)s /path/to/fonts/ttfs/a
  This will start off showing the fonts in that path.
 
%(c)s /path/to/fonts/ttfs/b Trouser
  This will let you view and choose fonts from the
  path and it will store them in a pog named "Trouser".
  The pog will be created if it's not already there.

%(c)s Lumberjack
  This will let you see the fonts in the pog named
  "Lumberjack". You can also uninstall individual
  fonts by selecting them. A cross will appear
  indicating the fonts that will be uninstalled.

%(c)s Camelot Spamalot
  This will let you see and choose fonts in
  "Camelot" and it will store them in "Spamalot"
  It lets you copy fonts between pogs.

%(c)s -i Cheese
  Will install the fonts in pog Cheese so you can
  use them in other apps.

%(c)s -u Trouser
  Will uninstall the fonts listed in pog Trouser,
  so you can't use 'em anymore.( You Naughty thing) 

%(c)s -t "Pigs on the wing"
  Will set the text and exit. It's odd that way.
  Restart Fonty again to see the change.
  * You can also do this from the gui, without a
  restart.
  
%(c)s -s 128 
  Will set the point size to 128 - Crazy man!

%(c)s -v 25
  Will show 25 fonts at a time. Beware large numbers!
	
%(c)s -s 64 -v 10 Pimple
  Will set the point size to 64, the number of fonts
  to view is 10 and then display the Pimple pog.

%(c)s -p Glutton
  If there are any fonts in "Glutton" that are not
  really on your drive/media anymore (perhaps you
  deleted them or the cat did) then this will go 
  through your pog and cull them.

%(c)s -c /some/path/to/fonts
  If Fonty keeps crashing on /some/path/to/fonts
  then you should run a check on that folder.
  This will 'mark' the dangerous fonts and let
  you use that folder in the future.

%(c)s -a /some/path HolyHandGrenade
  This will put all the fonts in that path into
  the Pog called HolyHandGrenade.

%(c)s -A /some/path Tutto
  This will do the same as -a above: start in that 
  path, but it will then walk down recursivly 
  through all sub-folders too. The fonts will 
  be placed in Tutto.

Your fontypython folder is:
%(folder)s
If you want to backup your pogs, that's where ya go.
%(contact)s

%(copy)s The fonts from %(folder)s are *already* in %(pog)s. The fontypython config file is damaged.
Please remove it and start again The process is complete. The target pog (%s) is currently installed, you can't use it as a target. There are no fonts in here. There are no fonts to see here, move along. There are no pogs available. There is no such item. There was an error writing the pog to disk. Nothing has been done These two are the same Pog. This folder has no fonts in it. This font is in %s This pog is empty This text cannot be drawn. Hey, it happens... Unhandled error:
Please move (%s) away from here and report this to us. Unicode problem. Font may be bad and it cannot be drawn. Uninstall Pog Uninstalls all selected Pogs.
Use SHIFT/CTRL+Click on the list above. Viewing a folder. Warning Welcome to Fonty Python version %s You can append fonts to your target Pog. You can remove fonts from the selected Target Pog. You cannot change an installed Pog. You cannot use a folder as the target argument. Try --help Your Source and Target are the same Pog. Your pogs are the same! Try -e Your text has been set to "%s"
Tip: Did you use quotes to surround your text?

Please start FontyPython again to see the result. Project-Id-Version: Fontypython 0.3.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2009-09-29 20:04+0200
PO-Revision-Date: 2009-07-07 12:35+0100
Last-Translator: Pietro Battiston <toobaz@email.it>
Language-Team: Italian Translation Project <tp@lists.linux.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Poedit-Language: Italian
X-Poedit-Country: ITALY
 
(Controlla anche i permessi dei file.) 
Impossibile creare la cartella .fonts in %s
Per favore verifica i permessi di scrittura e riprova. 
Impossibile creare la cartella in %s
Per favore verifica i permessi di scrittura e riprova. * indica i pog installati FIXME%(c)s [OPZIONI] [VISTA] [DESTINAZIONE]
VISTA   : Posizione in cui ci sono dei font.
         (Un pog o una cartella.)
DESTINAZIONE : Un "pog". Un luogo dove tenere questi font.

("%(c)s" da solo avvia l'interfaccia grafica.)

NB: Cerca di non usare spazi nei nomi di pog.
Se è necessario, "usa le virgolette".

Usa il parametro -e per più informazioni.

NOVITÀ : Sono oramai supportati font
TTF, OTF, Type1 (PFB, PFM) e TTC.
%(version)s

Idea base:
===============
Molti grafici hanno collezioni di file di font in grandi
cartelle su dischi o altri supporti. Fonty Python
permette di raccogliere i font ed organizzarli in
collezioni - chiamate "pog" - ovvero luoghi in cui
tenere tiPOGrafia. Logico, no?

Puoi stare tranquillo che i tuoi font non sono mai
 effettivamente spostati. È sufficiente selezionare
dei font ed inserirli in un pog, quindi installare e
 disinstallare i pog secondo necessità.
Non viene fatta nessuna copia dei font; per
installare i font vengono utilizzati solo dei
collegamenti.
Per esempio, puoi creare un pog chiamato "logo"
e metterci dentro tutti i file ttf con logo di aziende
che hai. A questo punto, quando devi lavorare con
un logo, è sufficiente installare il pog 'logo' ed
avviare la tua applicazione grafica preferita!

FP è anche un ottimo strumento per passare in
rassegna i font che ci sono sul computer, senza
dover per forza installarli a livello di sistema.

Gestisci i tuoi font in Gnu/Linux!
===============================
%(copy)s

%(warranty)s

%(contact)s
 %s esiste già. %s è stato epurato. %s non è stato epurato. %s richiede due argomenti: SORGENTE(cartella) OBIETTIVO(pog) I&nformazioni su... &Controllo font &Ripulisci TUTTA la selezione &Esci A&iuto &Epura pog &Seleziona TUTTI i font sorgente &Selezione Preferen&ze	Ctrl+S Impossibile trovare (%s). Prova -l per vedere i nomi. (%s) skipped. Non riesco a mostrarne il nome con la locale attuale. (%s) saltato. È un pog non valido. (Controlla il filtro!) Buon tentativo... ma non creerò un pog senza nome! Informazioni su... Informazioni su Fonty Python Sei sicuro? Errore voodoo maligno. Mi arrendo. Impossibile cancellare il pog.%s Cambia le preferenze Controllo font dannosi. Sto controllando i font: potrebbe prendere un po' di tempo. Doppio click su una cartella per avviare il controllo Scegli i font Ripulisci filtro Deseleziona tutto Ripulisci completamente la selezione. Chiudi il programma Copia di font da %(source)s a %(target)s Impossibile aprire (%s). Impossibile modificare il file di configurazione. Crea un nuovo pog vuoto Creo un nuovo pog: %s Cancella pog Deseleziona ogni pog selezionato. Vuoi epurare %s?

Epurare significa che tutti i font del
pog che non puntano a file effettivi
saranno rimossi dal pog. Inserisci un nome per il nuovo pog Errore Filtro: Trova i font che crashano Fonty. Cartelle Impossibile trovare il font, dovresti ripulire questo pog. Il font causa un errore di memoria, non è possibile raffigurarlo. Il font potrebbe essere corrotto, non è possibile raffigurarlo. Fonty Python Fonty Python - visualizza e gestisci ogni tipo di font in Gnu/Linux Fonty Python, versione %s Fonty Python... ehm... ha crashato. Fonty Python: porta i tuoi font allo scoperto! A&iuto	F1 Spiacente, questa installazione di wxpython non supporta l'Unicode. Fonty Python necessità di Unicode e semplicemente non può funzionare senza.

Per favore procurati ed installa la versione Unicode di python-wxgtk. Impossibile decifrare il/gli argomento/i. Verificare la variabile LANG. Attenzione: non incollare testo, ma digitarlo direttamente. Impossibile trovare %s Impossibile trovare "python-imaging"
Per favore installa questo pacchetto.

Suggerimento
===
Nella mia distribuzione posso cercarlo così:
aptitude search python-imaging
Restituisce vari risultati, tra cui:
python-imaging
Lo installo quindi così:
sudo aptitude install python-imaging

Assicurati che sia la versione 1.1.6-1 o
più recente.

Puoi sempre ottenere l'ultima versione qui:
http://www.pythonware.com/products/pil/index.htm
 Non ho trovato alcun font dannoso. Ho sistemato %(count)s fonts da %(folder)s in %(pog)s. Includi sottocartelle. Installa pog Installo (%s) Installa tutti i pog selezionati.
Usa SHIFT/CTRL+Click sulla lista sopra. Ma la volpe col suo balzo ha raggiunto il quieto fido Licenza Lista di %d pog Controllo in %s... Gestisci i tuoi font su Gnu/Linux.
NOVITÀ: Support font TTF, OTF, Typ1 (PFB, PFA) 
e TTC.

Molti grafici hanno collezioni di file di font in grandi
cartelle su dischi o altri supporti. Fonty Python
permette di raccogliere i font ed organizzarli in
collezioni - chiamate "pog" - ovvero luoghi in cui
tenere tiPOGrafia. Logico, no?

Puoi stare tranquillo che i tuoi font non sono mai
 effettivamente spostati. È sufficiente selezionare
dei font ed inserirli in un pog, quindi installare e
disinstallare i pog secondo necessità.
Non viene fatta nessuna copia dei font; per
installare i font vengono utilizzati solo dei
collegamenti.

Per esempio, puoi creare un pog chiamato "logo"
e metterci dentro tutti i file ttf con logo di aziende
che hai. A questo punto, quando devi lavorare con
un logo, è sufficiente installare il pog 'logo' ed
avviare la tua applicazione grafica preferita!

FP è anche un ottimo strumento per passare in
rassegna i font che ci sono sul computer, senza
dover per forza installarli a livello di sistema.
	
	%(copy)s
	%(contact)s
	 NB: se si vuole utilizzare degli spazi nel nome di un pog o di una cartella è necessario metterlo "tra virgolette". Nuovo pog Non ho trovato il file di configurazione, ne ricreo uno standard. Nessun font supportato qui... Non è stato possibile installare neanche un font di questo pog.
La cartella di origine dei font è stata probabilmente spostata o rinominata. Non è stato possibile disinstallare neanche un font di questo pog.
Nessuno di questi font era nella tua cartella dei font, per favore controlla eventuali link interrotti nella cartella .fonts (con un punto all'inizio) all'interno della tua home.
Il pog è stato segnato come "non installato". Niente da fare O cribbio... Oh caspita, Uno o più dei font selezionati sono installati: modificare la selezione e riprovare. Lunghezza della pagina: Per favore controlla gli argomenti, sembrano essere troppi.
(Ricorda: un argomento da cinque minuti viene una sterlina, ma se ne compri dieci paghi solo otto sterline.)

NB: Se il nome di un pog o di una cartella contiene spazi, mettilo "tra virgolette". Per favore scegli un pog o una cartella di font sulla sinistra. Per favore scegli una sorgente. Per favore sposta:"%s" in un'altra posizione e riavvia Fonty Python. Per favore usa un numero per %s Impossibile modificare il pog.
Controlla il filesystem.%s Pog già installato. Pog vuoto. Il pog è invalido, modificalo manualmente. Pog non installato. Pog Dimensione (in punti): Epurare font? Metti i font in %s Sei sicuro di voler cancellare %s? Rimuovi fantasmi dal pog selezionato. Rimuovi i font da %s Rimuovo (%s) SPIACENTE: L'UNICODE DEVE ESSERE SUPPORTATO Testo di esempio: Seleziona ASSOLUTAMENTE TUTTI i font nella sorgente scelta. I font selezionati sono ora in %s. I font selezionati sono stati rimossi. Impostazioni Impossibile disinstallare alcuni font.
Per favore controlla eventuali link interrotti nella cartella .fonts (con un punto all'inizio) all'interno della tua home.%s Non è stato possibile installare alcuni font.
Probabilmente la cartella di origine dei font è stata rimossa o rinominata.
Doversti epurarli o modificare manualmente il pog. Spiacente, (%s) non esiste. Prova --list. Spiacente, non trovo (%s). Prova -l per vedere i nomi. Spiacente, al momento sono supportati solo sistemi Gnu/Linux. Parto in %s: Pog destinazione Grazie Il formato base è:
%(c)s [VISTA] [DESTINAZIONE]
  VISTA   = Un posto in cui ci sono dei font. Può
		   essere un pog o una cartella.
  DESTINAZIONE = Un pog, ovvero un posto
                  in cui catalogare dei font.
                  Se non includi una destinazione, puoi
                  solo guardare/modificare.

Suggerimenti:
=====
* Non usare spazi nei nomi dei pog. Se devi proprio,
  metti i nomi tra virgolette, es. "Pog di Ni"
* Se la tua applicazione grafica (es. The Gimp) non
  vede i font che hai installato, riavviala. Talvolta un
  sistema necessita di un po' di tempo per riconoscere
  tutti i nuovi font nella tua cartella dei font.

Esempi - principalmente usando le opzioni brevi, vedi -h:
=========
%(c)s /percorso/dei/font/ttf/a
  Mostra i font presenti a tale indirizzo.
 
%(c)s /percorso/dei/font/ttf/b Pantaloni
  Visualizza i font presenti all'indirizzo dato e mettili
  in un pog chiamato "Pantaloni".
  Se il pog non esiste, verrà creato.

%(c)s Felpe
  Questo comando di permette di vedere i font
  nel pog chiamato "Felpe". Puoi anche
  disinstallare individualmente i font selezionandoli.
  Comparirà una croce ad indicare i font da
  disinstallare.
%(c)s Stelle Stalle
  Questo comando permette di vedere e scegliere
  i font in "Stelle" ed aggiungerli in "Stalle".
  Si può così copiare font tra i pog.

%(c)s -i Formaggio
  Installa i font del pog Formaggio, così da poterli
  utilizzare nelle applicazioni.

%(c)s -u Pantaloni
  Disinstalla i font contenuti nel pog Pantaloni,
  rendendoli non utilizzabili nelle altre applicazioni.

%(c)s -t "Berlusconi? Quiz, tv, paghe da fame"
  Imposta questo testo come esempio.
  Riavvia Fonty per vedere il cambiamento.
  * Il testo di esempio si può anche modificare
  dall'interfaccia grafica, senza dover riavviare.
  
%(c)s -s 128 
  Imposta la dimensione a 128 punti (troppo!)

%(c)s -v 25
  Mostra 25 font alla volta. Non esagerare!
    
%(c)s -s 64 -v 10 Brufoli
  Imposta la dimensione a 64 punti, il numero
  di font da visualizzare a 10 e mostra il pog
  Brufoli.

%(c)s -p Ingordo
  Se ci sono dei font in Ingordo non più presenti
  (perché li hai cancellati, o l'ha fatto il tuo gatto)  nei tuoi dischi/supporti, rimuovili dal pog.

%(c)s -c /percorso/per/qualche/font
  Se Fonty crasha continuamente in /percorso/per/qualche/font,
  dovresti avviare un controllo su quella cartella.
  I font maligni verranno così "contrassegnati", e la cartella
  sarà di nuovo utilizzabile.

%(c)s -a /un/percorso GranataSacra
  Metti tutti i font a quell'indirizzo
  nel pog chiamato GranataSacra.

%(c)s -A /un/indirizzo Tutto
  Simile ad -a visto sopra: parti da quell'indirizzo,
  ma poi visista ricorsivamente tutte le sottocartelle.
  I font saranno messi in Tutto.

La tua cartella di fontypython è:
%(folder)s
Se vuoi fare un backup dei tuoi pog, li trovi lì.
%(contact)s

%(copy)s I font della cartella %(folder)s sono *già* in %(pog)s. Il file di configurazione fontypython è danneggiato.
Per favore rimuovilo e riprova. Il processo è completo. Il pog destinazione (%s) è attualmente installato, non puoi utilizzarlo come destinazione. Non ci sono font qui. Qui non c'è nessun font da vedere. Nessun pog disponibile. Non c'è un tale elemento. C'è stato un errore nella memorizzazione del file. Non è stato fatto nulla. Questi due pog sono lo stesso. Questa cartella non contiene alcun font. Questo font è in %s Questo pog è vuoto Impossibile raffigurare questo testo. Oh, capita... Errore non gestito:
Per favore sposta (%s) da questa posizione e riporta l'errore ai programmatori. Problema unicode. Il font potrebbe essere corrotto, non è possibile raffigurarlo. Disinstalla pog Disinstalla tutti i pog selezionati.
Usa SHIFT/CTRL+Click sulla lista sopra. Visualizzazione di una cartella. Attenzione Benvenuto in Fonty Python versione %s Puoi aggiungere font al tuo pog destinazione. Puoi rimuovere dei font dal pog destinazione. Non puoi modificare un pog installato. Non puoi utilizzare una cartella come destinazione. Prova --help Il tuo pog origine e quello destinazione sono lo stesso. I pog sono lo stesso! Prova -e Il tuo testo è stato impostato a "%s"
Consiglio: Hai messo il tuo testo tra virgolette?

Per favore riavvia Fonty Python per vedere il risultato. 