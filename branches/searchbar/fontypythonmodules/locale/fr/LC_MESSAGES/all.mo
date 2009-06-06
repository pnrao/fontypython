��    g      T  �   �      �  $   �  Y   �  R   0	     �	  p  �	          #     :     N     g          �     �     �     �  .   �     �     �       %     .   9     h     v     �     �     �  +   �     �  
          �   1     �     �     �     �          	  #        :  �  C  �  �  $  �     �     �     �     �     �     �  0     n   7  �   �     �  �   �  1   �     �  2   �            $   +     P     f     k  	   w     �     �     �     �     �     �     �  !        (  s   1  w   �  &     0   D     u  H   �  I   �       +   0     \     y  A   �     �     �                .     I     e  8   w     �     �  "   �  (   �  #      :   :   (   u      �      �   �   �   o  [!  (   �"  b   �"  f   W#     �#  |  �#     Z)     p)     �)     �)     �)     �)  
   �)     *     *     *  F   #*     j*  	   �*     �*  .   �*  2   �*     +  &   $+  !   K+     m+     �+  /   �+     �+     �+  &   �+  �   ,  !   �,     �,  0   �,     -     -     -  8   $-     ]-  �   f-    K.  �  T/     �0      1  -   1     D1     L1     d1  U   p1  n   �1  �   52     3  �   33  4   �3      #4  E   D4     �4     �4  3   �4     �4     �4     5     5     (5     >5  ,   Y5     �5     �5     �5  4   �5  2   �5     06  }   86  �   �6  F   ]7  F   �7     �7  l   �7  V   d8     �8      �8  !   �8  !   9  X   89     �9  &   �9     �9     �9  #   �9  $   :     A:  >   ]:     �:  	   �:     �:     �:  .   �:  I   *;  $   t;     �;  %   �;  �   �;     B       Z                 =   [   %   6       C   T   >      I   F   
          P   2   4   e   J       b                     1   M   \      7      .                 :   X      "           +       a                 /   c   &       K   A   !                  R   (   V   ,          	                  W          D      f         g      H   Y      S   )          ;   ]   ^      #   U   @   $          5   E   Q   *   '      <       O   G   -   3       _   0       ?   `                     9   L   d           N   8    
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
 %s already exists. %s has been installed. %s has been purged. %s has been uninstalled. %s has not been purged. %s is to be deleted &About &File &Help &Settings	Ctrl+S (%s) cannot be found. Try -l to see the names. (Check your filter!) About About FontyPython Append From: %(source)s To:%(target)s Append from Pog:%(source)s into Pog:%(target)s Are you sure? Bad voodoo error. I give up. Cannot delete the Pog.%s Clear selection Close the app Copying fonts from %(source)s to %(target)s Could not open (%s). Delete Pog Deselects any chosen pogs. Do you want to purge %s?

Purging means all the fonts in the pog
that are not pointing to actual files
will be removed from this pog. Enter a name for the new pog Error Error creating a wximage of %s Filter: Folders Fonty Python Fonty Python: bring out your fonts! H&elp	F1 I cannot find "python-imaging"
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
The pog has been marked as "not installed". Page length: Please check your arguments, there seem to be too many.
(Remember: it's one pound for a five-minute argument, but only eight pounds for a course of ten.)

NB: If you wanted to use spaces in a pogname or folder then please put "quotes around them."  Please choose a Pog or a Font folder on the left. Please choose a Source. Pog cannot be written to.
Check your filesystem.%s Pog is already installed. Pog is empty. Pog is invalid, please hand-edit it. Pog is not installed. Pogs Point size: Purge Pog Purge font? Put fonts into %s Remove %s, are you sure? Remove fonts from %s Removing (%s) Sample text: Selected fonts are now in %s. Selected fonts have been removed. Settings Some fonts could not be uninstalled.
Please check your home .fonts (with a dot in front) folder for broken links.%s Some fonts did not install.
Perhaps the original fonts folder has moved or been renamed.
You should purge or hand-edit. Sorry, (%s) does not exist. Try --list Sorry, can't find (%s). Try -l to see the names. Target Pogs The fontypython config file is damaged.
Please remove it and start again The target pog (%s) is currently installed, you can't use it as a target. There are no fonts in here. There are no fonts to see here, move along. There are no pogs available. There is no such item. There was an error writing the pog to disk. Nothing has been done These two are the same Pog. This folder has no fonts in it. This pog is empty Uninstall Pog Viewing (editable) Pog: %s Viewing (installed) Pog: %s Viewing Folder:%s Viewing Pog:%(source)s, but Pog:%(target)s is installed. Viewing a folder. Warning Welcome to Fonty Python version %s You can append fonts to your target Pog. You cannot change an installed Pog. You cannot use a folder as the target argument. Try --help Your Source and Target are the same Pog. Your active Target Pog is:%s Your pogs are the same! Try -e Your text has been set to "%s"
Tip: Did you use quotes to surround your text?

Please start FontyPython again to see the result. Project-Id-Version: fontypython 0.2.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2009-05-28 15:55+0200
PO-Revision-Date: 2008-01-22 19:46+0200
Last-Translator: Donn Ingle <donn.ingle@gmail.com>
Language-Team: French <traduc@traduc.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n > 1);
 
(Vérifiez également les permissions.) 
Impossible de créer le dossier .fonts dans %s
Please check your write permissions and try again. 
Impossible de créer le dossier dans %s
Veuillez vérifier les permissions d'écriture et réessayer.  * indique les pogs installés FIXME%(c)s [OPTIONS] [EMPLACEMENT] [CIBLE]

EMPLACEMENT : L'endroit où sont les polices de caractères. Un pog ou un dossier.
CIBLE       : Un "pog". L'endroit où enregistrer ces polices (seulement des références aux fichiers)

NB : Essayez de ne pas utiliser d'espace dans le nom des pogs. Si vous devez le faire, mettez le nom entre guillemets.

Veuillez utiliser l'option -e ou --example pour avoir plus d'informations.

%(version)s

L'idée de base :
===============
Beaucoup de graphistes ont leur collection de fichiers TTF dans
un gros répertoire. Fonty Python va vous permettre de rassembler
vos polices de caractères et de les ranger dans des collections
appelées "pogs", qui vient de tyPOGraphie. Pourquoi pas ?

Vos fichiers ne seront jamais déplacés
(pas d'inquiétude). Tout ce qui se passe est le placement de
références à vos fichiers (que vous sélectionnerez visuellement)
dans un pog, que vous pourrez ensuite installer ou désinstaller
en fonction de vos besoins.

Par exemple, vous pouvez avoir un pog appelé "logos" dans lequel
vous placez tous les fichiers TTF que vous possédez de logos.
Après ça, quand vous aurez besoin  de travailler avec ces logos, vous
installez simplement le pog "logos" et commencez à travailler !

Fonty Python est aussi approprié pour visionner vos fichiers TTF
où qu'ils soient sur votre ordinateur.

%(copy)s
%(warranty)s
%(contact)s
 Pog %s est installé. Le Pog %s est pas installé. %s n'a pas été nettoyé. Le Pog %s n'est pas installé. %s n'a pas été nettoyé. %s va être supprimé. À &Propos &Fichier &Aide &Options	Ctrl+O (%s) ne peut être trouvé. essayez -l pour voir les noms disponibles. ou videz le filtre ci-dessous. À Propos À Propos de Fonty Python Placer en %(target)s les polices de %(source)s Placer les polices dans %(target)s from %(source)s Êtes-vous certain ? Erreur maléfique vaudou, j'abandonne. Impossible de supprimer le Pog.%s Ne rien sélectionner Quitter Fonty Python Copie des polices de %(source)s vers %(target)s Impossible d'ouvrir (%s). Supprimer le Pog Déselectionner tous les Pogs choisis. Voulez-vous nettoyer %s ?

Nettoyer signifie que toutes les polices du Pog qui
ne pointent pas vers des fichiers existants en
seront supprimées. Entrez un nom pour le nouveau Pog Erreur Erreur lors de la création d'une image Wx de %s Filtre: Dossiers Fonty Python Fonty Python : redécouvrez vos polices de caractères ! &Aide	F1 (String needs new translation)Fonty Python dépend de "PIL" - Python Imaging Library.
Veuillez installer "python-imaging" en utilisant les outils
de votre distribution.
Voyez sur http://www.pythonware.com/products/pil/index.htm
 (String needs new translation)Fonty Python dépend de "wxPython".
"Veuillez installer "python-wxgtkX.Y" (ou supérieur), voici les détails :
Sur Ubuntu, vous devriez pouvoir taper :
sudo apt-get install python-wxgtk2.6

Voyez sur http://wxpython.org/download.php
 (String needs new translation)
Impossible de trouver python-wxversion, cela
peut signifier qu'il vous manque des dépendances.
Fonty Python va tout de même essayer de démarrer...

Sur Ubuntu, vous devriez pouvoir taper :
sudo apt-get install python-wxgtkX.Y

Si vous obtenez de longs messages d'erreur, vous aurez
"besoin d'installer python-wxgtk2.6 ou supérieur.
Voyez sur http://wxpython.org/download.php
 Installer le Pog Installer le Pog (%s) Portez ce vieux whisky au juge blond qui boit License Affichage de %d pog(s)  Nouveau Pog Aucun fichier de configuration détecté, création avec les paramètres par défaut. Pas la moindre police de ce pog n'a pu être installée.
Le dossier originel a du être supprimé ou renommé. Pas la moindre police de ce pog n'a pu être désinstallée.
Aucune d'entre elles n'étaient dans votre dossier de polices, veuillez
vérifiez le dossier ~/.fonts/ (sans oublier le point).
Le pog a été marqué comme désinstallé. Longueur de la page: Veuillez vérifier vos arguments, il semble y en avoir trop.

NB : Si vous souhaitez utiliser des espaces dans le nom d'un
pog ou d'un fichier, alors veuillez les entourer de guillemets. Veuillez choisir un Pog ou un dossier sur la gauche. Choisissez un dossier ou un pog. Le pog ne peut être enregistré.
Vérifiez le système de fichier.%s Pog est installé. Le pog est vide. Le pog est invalide, veuillez l'éditer à la main. Le Pog n'est pas installé. Pogs Longueur de la page: Nettoyer le Pog Supprimer la police ? Placer les polices dans %s Êtes-vous certain de vouloir supprimer %s ? Supprimer les polices de %s Visualisation de (%s) Texte affiché: Les polices sélectionnées sont maintenant dans %s. Les polices sélectionnées ont été supprimées. Options Certaines polices ne peuvent pas être désinstallées.
Veuillez vérifier votre dossier ~/.fonts/ (sans oublier le point).%s Certaines polices n'ont pas été installées.
Peut-être que le dossier d'origine a été déplacé ou renommé.
Vous devriez le purger (-p) ou l'éditer à la main. (%s) ne peut être trouvé. essayez -l pour voir les noms disponibles. (%s) ne peut être trouvé. essayez -l pour voir les noms disponibles. Pogs Cibles Le fichier ~/.fontypython/fp.conf semble être endommagé.
Veuillez le supprimer puis relancer Fonty Python. Le pog (%s) est actuellement installé, vous ne pouvez pas l'utiliser comme une cible. Aucun fonts disponible. Choisissez un dossier ou un Pog, Il n'y a pas autant d'éléments. Il n'y a pas autant d'éléments. Il y a eu une erreur pendant l'écriture du pog sur le disque. Rien n'a été effectué. Vos pogs sont les mêmes. Ce dossier ne contient pas de fichier. Le pog est vide. Désinstaller le Pog Visualisation (editable) de Pog: %s Visualisation du Pog (installé): %s Visualisation de Dossier:%s Visualisation Pog:%(source)s, but Pog:%(target)s is installed. Visualisation de dossier. Attention Bienvenue dans Fonty Python %s Placer les polices dans Pog Vous ne pouverz pas modifier un Pog installé. Vous ne pouvez pas utiliser un dossier comme un pog cible. Essayez --help Vos pogs sont les mêmes! Essayez -e Source en cours : %s Vos pogs sont les mêmes ! Essayez -e Votre texte a été assigné à "%s"
Idée : Utilisez-vous les guillemets pour encadrer votre texte ?

Relancez Fonty Python pour voir le résultat. 