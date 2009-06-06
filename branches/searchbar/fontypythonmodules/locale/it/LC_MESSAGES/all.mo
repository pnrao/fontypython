��    {      �  �   �      h
  $   i
  Y   �
  R   �
     ;  p  W     �     �     �               7     K     R     X     ^  .   o     �     �     �  %   �  .   �           .     K     d     t     �  +   �     �  #   �  
   �       �        �     �     �     �     �     �  *     '   6     ^     k     �  #   �     �  �   �  �  �  �  1  $  �               '     =     E     W  0   _  n   �  �   �     �  	   �     �     �  �     1         2  J   J     �  2   �     �     �  $        0     F     K  	   W     a     m          �     �      �     �     �  !         )   s   2   w   �   &   !  0   E!  1   v!     �!     �!  H   �!  I   "     ]"  +   y"     �"     �"  A   �"     #     7#     W#     q#     �#  G   �#     �#     �#     $     #$  8   5$     n$     �$  "   �$  (   �$  2   �$  #   %  :   +%  (   f%     �%     �%  �   �%  �  L&  '   �'  c   (  \   f(     �(  �  �(     �.     �.     �.     �.     /     )/     F/     Z/     `/     g/  5   z/     �/     �/     �/  +   �/  .   #0     R0  "   ^0      �0     �0     �0     �0  (   �0     1  1   1     Q1  !   ^1  v   �1  "   �1     2  +   !2     M2     U2      ^2  /   2  @   �2     �2     �2  #   3  .   ;3  	   j3  �   t3  �  M4  �  6    �7     �9     �9  5   �9     ,:     4:  	   D:  A   N:  �   �:  %  ;     E<     T<     a<     m<  �   �<  ?   �=     �=  D   �=     )>  9   I>     �>  
   �>  +   �>     �>     �>     �>  	   �>     ?     ?  "   )?     L?     a?  +   n?     �?  "   �?  &   �?     �?  �   @  �   �@  )   VA  6   �A  =   �A     �A     B  U   B  [   tB     �B  #   �B     
C     "C  M   =C     �C  (   �C      �C     �C     	D  c   D     �D  *   �D  (   �D  !   �D  D   E      LE  
   mE  %   xE  -   �E  -   �E  &   �E  @   !F  8   bF  %   �F     �F  �   �F     '   e   n       X      >   d                 t      *              5   ,       "      j   :      b                   T   Q       (   G   g           v   R          ^               0   -   ?   ]       .   8   D               )   +           @             {       I       2      \   H   E   z              L   A   ;   =   i       y   Z   
           9   s       p       3              J   1   #          M   m   [      6   P   _   q   /           4   l   N         7           k              u   F   B   %   <   h   S   O   `   o   c   V   W   C         K           f   $   Y   a   w       !   r   	   &   x          U                     
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
 %s already exists. %s has been installed. %s has been purged. %s has been uninstalled. %s has not been purged. %s is to be deleted &About &File &Help &Settings	Ctrl+S (%s) cannot be found. Try -l to see the names. (Check your filter!) About About FontyPython Append From: %(source)s To:%(target)s Append from Pog:%(source)s into Pog:%(target)s Are you sure? Bad voodoo error. I give up. Cannot delete the Pog.%s Change settings Clear selection Close the app Copying fonts from %(source)s to %(target)s Could not open (%s). Could not write to the config file. Delete Pog Deselects any chosen pogs. Do you want to purge %s?

Purging means all the fonts in the pog
that are not pointing to actual files
will be removed from this pog. Enter a name for the new pog Error Error creating a wximage of %s Filter: Folders Font cannot be drawn. Font cannot be found, you should purge it. Font may be bad and it cannot be drawn. Fonty Python Fonty Python version %s Fonty Python, um ... crashed. Fonty Python: bring out your fonts! H&elp	F1 I am sorry, but Unicode is not supported by this installation of wxPython. Fonty Python relies on Unicode and will simply not work without it.

Please fetch and install the Unicode version of python-wxgtk. I cannot find "python-imaging"
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
 I cannot find "python-wxgtkX.Y"
Please install this package - NB: ensure that
you use only the "Unicode build".

TIP
===
On my distro I can search for it like this:
aptitude search python-wx
This returns many results, one of which is:
python-wxgtk2.8
I then install it like this:
sudo aptitude install python-wxgtk2.8

Make sure it's at least version 2.6

You can also get the latest version from here:
http://wxpython.org/download.php
 I cannot find "python-wxversion"
Please install this package - NB: ensure that
you use only the "Unicode build".

TIP
===
On my distro I can search for it like this:
aptitude search python-wx
This returns many results, one of which is:
python-wxversion 
I then install it like this:
sudo aptitude install python-wxversion 

If you get long error messages, you will need to
install python-wxgtk*, where the star means the 
version number and it should be at least 2.6

You can also get the latest version from here:
http://wxpython.org/download.php
 Install Pog Installing (%s) Jump the lazy dog fox Licence Listing %d pog(s) New Pog No config file found, creating it with defaults. Not a single font in this pog could be installed.
The original font folder has probably moved or been renamed. Not a single font in this pog could be uninstalled.
None of the fonts were in your fonts folder, please check your home .fonts (with a dot in front) folder for broken links.
The pog has been marked as "not installed". Nothing to do Oh boy... Oh dear, Page length: Please check your arguments, there seem to be too many.
(Remember: it's one pound for a five-minute argument, but only eight pounds for a course of ten.)

NB: If you wanted to use spaces in a pogname or folder then please put "quotes around them."  Please choose a Pog or a Font folder on the left. Please choose a Source. Please restart Fonty Python after you have moved:"%s" to some other place. Please use a number for %s Pog cannot be written to.
Check your filesystem.%s Pog is already installed. Pog is empty. Pog is invalid, please hand-edit it. Pog is not installed. Pogs Point size: Purge Pog Purge font? Put fonts into %s Remove %s, are you sure? Remove fonts from %s Removing (%s) SORRY: UNICODE MUST BE SUPPORTED Sample text: Selected fonts are now in %s. Selected fonts have been removed. Settings Some fonts could not be uninstalled.
Please check your home .fonts (with a dot in front) folder for broken links.%s Some fonts did not install.
Perhaps the original fonts folder has moved or been renamed.
You should purge or hand-edit. Sorry, (%s) does not exist. Try --list Sorry, can't find (%s). Try -l to see the names. Sorry, only Gnu/Linux is supported at the moment. Source Folder, or Pog Target Pogs The fontypython config file is damaged.
Please remove it and start again The target pog (%s) is currently installed, you can't use it as a target. There are no fonts in here. There are no fonts to see here, move along. There are no pogs available. There is no such item. There was an error writing the pog to disk. Nothing has been done These two are the same Pog. This folder has no fonts in it. This font cannot be drawn This font is in %s This pog is empty Unhandled error:
Please move (%s) away from here and report this to us. Uninstall Pog Viewing (editable) Pog: %s Viewing (installed) Pog: %s Viewing Folder:%s Viewing Pog:%(source)s, but Pog:%(target)s is installed. Viewing a folder. Warning Welcome to Fonty Python version %s You can append fonts to your target Pog. You can remove fonts from the selected Target Pog. You cannot change an installed Pog. You cannot use a folder as the target argument. Try --help Your Source and Target are the same Pog. Your active Target Pog is:%s Your pogs are the same! Try -e Your text has been set to "%s"
Tip: Did you use quotes to surround your text?

Please start FontyPython again to see the result. Project-Id-Version: Fontypython 0.3.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2009-05-28 15:55+0200
PO-Revision-Date: 2008-01-22 19:49+0200
Last-Translator: Donn Ingle <donn.ingle@gmail.com>
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
 %s esiste già. %s installato. %s è stato epurato. %s disinstallato %s non è stato epurato. %s sta per essere cancellato I&nformazioni su... &File A&iuto Preferen&ze	Ctrl+S Impossibile trovare (%s). Prova -l per vedere i nomi. (Controlla il filtro!) Informazioni su... Informazioni su Fonty Python Aggiungi i font da: %(source)s a:%(target)s Aggiungi dal pog:%(source)s nel pog:%(target)s Sei sicuro? Errore voodoo maligno. Mi arrendo. Impossibile cancellare il pog.%s Cambia le preferenze Deseleziona tutto Chiudi il programma Copia di font da %(source)s a %(target)s Impossibile aprire (%s). Impossibile modificare il file di configurazione. Cancella pog Deseleziona ogni pog selezionato. Vuoi epurare %s?

Epurare significa che tutti i font del
pog che non puntano a file effettivi
saranno rimossi dal pog. Inserisci un nome per il nuovo pog Errore Errore nella creazione di una wximage di %s Filtro: Cartelle Impossibile raffigurare il font. Impossibile trovare il font, dovresti epurarlo. Il font potrebbe essere corrotto, non è possibile raffigurarlo. Fonty Python Fonty Python, versione %s Fonty Python... ehm... ha crashato. Fonty Python: porta i tuoi font allo scoperto! A&iuto	F1 Spiacente, questa installazione di wxpython non supporta l'Unicode. Fonty Python necessità di Unicode e semplicemente non può funzionare senza.

Per favore procurati ed installa la versione Unicode di python-wxgtk. Impossibile trovare "python-imaging"
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
 Impossibile trovare "python-wxgtk"
Per favore installa questo pacchetto 
NB: utilizza un "build Unicode".

Suggerimento
===
Nella mia distribuzione posso cercarlo così:
aptitude search python-wx
Restituisce vari risultati, tra cui:
python-wxgtk2.8
Lo installo quindi così:
sudo aptitude install python-wxgtk2.8

Assicurati che sia la versione 2.6 o più recente.

Puoi sempre ottenere l'ultima versione qui:
http://wxwidgets.org/downloads
 Impossibile trovare "python-wxversion"
Per favore installa questo pacchetto
NB: utilizza un "build Unicode".

Suggerimento
===
Nella mia distribuzione posso cercarlo così:
aptitude search python-wx
Restituisce vari risultati, tra cui:
python-wxversion 
Lo installo quindi così:
sudo aptitude install python-wxversion 

Se ricevi lunghi messaggi di errore, devi installare
python-wxgtk*, dove l'asterisco sta per il numero
di versione e dovrebbe essere almeno 2.6.
Puoi sempre ottenere l'ultima versione qui:
http://wxpython.org/download.php
 Installa pog Installo (%s) Ma la volpe col suo balzo ha raggiunto il quieto fido Licenza Lista di %d pog Nuovo pog Non ho trovato il file di configurazione, ne ricreo uno standard. Non è stato possibile installare neanche un font di questo pog.
La cartella di origine dei font è stata probabilmente spostata o rinominata. Non è stato possibile disinstallare neanche un font di questo pog.
Nessuno di questi font era nella tua cartella dei font, per favore controlla eventuali link interrotti nella cartella .fonts (con un punto all'inizio) all'interno della tua home.
Il pog è stato segnato come "non installato". Niente da fare O cribbio... Oh caspita, Lunghezza della pagina: Per favore controlla gli argomenti, sembrano essere troppi.
(Ricorda: un argomento da cinque minuti viene una sterlina, ma se ne compri dieci paghi solo otto sterline.)

NB: Se il nome di un pog o di una cartella contiene spazi, mettilo "tra virgolette". Per favore scegli un pog o una cartella di font sulla sinistra. Per favore scegli una sorgente. Per favore sposta:"%s" in un'altra posizione e riavvia Fonty Python. Per favore usa un numero per %s Impossibile modificare il pog.
Controlla il filesystem.%s Pog già installato. Pog vuoto. Il pog è invalido, modificalo manualmente. Pog non installato. Pog Dimensione (in punti): Epura pog Epurare font? Metti i font in %s Sei sicuro di voler cancellare %s? Rimuovi i font da %s Rimuovo (%s) SPIACENTE: L'UNICODE DEVE ESSERE SUPPORTATO Testo di esempio: I font selezionati sono ora in %s. I font selezionati sono stati rimossi. Impostazioni Impossibile disinstallare alcuni font.
Per favore controlla eventuali link interrotti nella cartella .fonts (con un punto all'inizio) all'interno della tua home.%s Non è stato possibile installare alcuni font.
Probabilmente la cartella di origine dei font è stata rimossa o rinominata.
Doversti epurarli o modificare manualmente il pog. Spiacente, (%s) non esiste. Prova --list. Spiacente, non trovo (%s). Prova -l per vedere i nomi. Spiacente, al momento sono supportati solo sistemi Gnu/Linux. Cartella sorgente o pog Pog destinazione Il file di configurazione fontypython è danneggiato.
Per favore rimuovilo e riprova. Il pog destinazione (%s) è attualmente installato, non puoi utilizzarlo come destinazione. Non ci sono font qui. Qui non c'è nessun font da vedere. Nessun pog disponibile. Non c'è un tale elemento. C'è stato un errore nella memorizzazione del file. Non è stato fatto nulla. Questi due pog sono lo stesso. Questa cartella non contiene alcun font. Impossibile raffigurare il font. Questo font è in %s Questo pog è vuoto Errore non gestito:
Per favore sposta (%s) da questa posizione e riporta l'errore ai programmatori. Disinstalla pog Visualizzazione del pog (modificabile): %s Visualizzazione del pog (installato): %s Visualizzazione della cartella:%s Visualizzando il pog:%(source)s, ma il pog:%(target)s è installato. Visualizzazione di una cartella. Attenzione Benvenuto in Fonty Python versione %s Puoi aggiungere font al tuo pog destinazione. Puoi rimuovere dei font dal pog destinazione. Non puoi modificare un pog installato. Non puoi utilizzare una cartella come destinazione. Prova --help Il tuo pog origine e quello destinazione sono lo stesso. Il tuo attuale pog destinazione è:%s I pog sono lo stesso! Prova -e Il tuo testo è stato impostato a "%s"
Consiglio: Hai messo il tuo testo tra virgolette?

Per favore riavvia Fonty Python per vedere il risultato. 