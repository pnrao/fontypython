##	Fonty Python Copyright (C) 2006, 2007, 2008, 2009 Donn.C.Ingle
##	Contact: donn.ingle@gmail.com - I hope this email lasts.
##
##	This file is part of Fonty Python.
##	Fonty Python is free software: you can redistribute it and/or modify
##	it under the terms of the GNU General Public License as published by
##	the Free Software Foundation, either version 3 of the License, or
##	(at your option) any later version.
##
##	Fonty Python is distributed in the hope that it will be useful,
##	but WITHOUT ANY WARRANTY; without even the implied warranty of
##	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##	GNU General Public License for more details.
##
##	You should have received a copy of the GNU General Public License
##	along with Fonty Python.  If not, see <http://www.gnu.org/licenses/>.

## fpsys : fonty python system.
## I debated calling it fpglobals.
## This is a common-ground for variables and defs that will be used from
## other modules - so they are global to everything.

import sys, os, pickle

import linux_safe_path_library
LSP = linux_safe_path_library.linuxSafePath()

import fontybugs
#import pathcontrol
#import strings

import fontcontrol

import charmaps

#import wx

import subprocess


##Sept 2017 - Trying to get XDG compliance going.
from gi.repository import GLib

class PathControl:
    """
    Instanced here, in fpsys, where it is used globally.

    TASKS:
    ===
    0. Sets an error dict and returns on various failures.
    1. Makes the fontypython path - in $XDG_DATA_HOME (GLib will supply this)
    2. Provide paths for fontypython on Linux
    3. Provide list of pog names (without the .pog extension)
    4. Provide a list of pog FILE names (with .pog extension)

    * All these vars contain/return BYTE STRING paths and files.

    NOTE
    ==
    This class is imported and used in the 'fontypython' wrapper too - when there's
    a segfault.

    Sept 2017: Freedesktop specs being used now:
    ===
    https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
    # >>>from gi.repository import GLib
    # >>>GLib.get_user_data_dir()
    # '/home/donn/.local/share'

    GLib:
    ==
    https://developer.gnome.org/glib/2.40/glib-Miscellaneous-Utility-Functions.html#g-get-user-data-dir
    """
    __FIRSTRUN = True
    __HOME = os.environ["HOME"] # Is a byte string under Linux.

    __fp_dir = None
    __fpconf_paf = None
    __fonts_dir = None

    def __init__( self ):

        self.__ERROR_STATE={}

        ## Class var to detect the very first run of this code:
        if PathControl.__FIRSTRUN:
            PathControl.__FIRSTRUN = False

            ## Use Glib to get the XDG data path:
            XDG_DATA_HOME = GLib.get_user_data_dir() # ?? What kinds of errors can happen here?

            ## If the fancy new XDG_DATA_HOME does not actually exist, we want to fall back:
            ## I don't know if this is even a possibility... :|
            if not os.path.exists(XDG_DATA_HOME):

                ## We are in fallback to the old fonty dirs etc.
                fp_dir = PathControl.__HOME + "/.fontypython"
                try:
                    self.__try_test_make_dir(fp_dir, "NoFontypythonDir")
                except:
                    return #Serious error, bail.
                else:
                    PathControl.__fp_dir = fp_dir # Record it for use.

                fonts_dir = PathControl.__HOME + "/.fonts"
                try:
                    self.__try_test_make_dir(fonts_dir, "NoFontsDir")
                except:
                    pass # Not too bad. Fonts dir will be None.
                else:
                    PathControl.__fonts_dir = fonts_dir
                ## End of old fonty fallback

            else:
                ## We are in valid XDG terrain: ~/.local/share/ (or whatever) exists.
                ## We may hit perm errors within there, I guess..
                x_fp_dir = XDG_DATA_HOME + "/fontypython"
                try:
                    self.__try_test_make_dir(x_fp_dir, "NoFontypythonDir")
                except:
                    return #Serious error
                else:
                    PathControl.__fp_dir = x_fp_dir


                x_fonts_dir = XDG_DATA_HOME + "/fonts"
                try:
                    self.__try_test_make_dir(x_fonts_dir, "NoFontsDir")
                except:
                    pass
                else:   
                    PathControl.__fonts_dir = x_fonts_dir

                ## Decide on what can be upgraded..
                # If new fp_dir exists *and* old fp_dir exists, then we can upgrade.
                # Since, by now, x_fp_dir does exist, we need only look for the old.

                old_fp_dir = PathControl.__HOME + "/.fontypython"
                old_fonts_dir = PathControl.__HOME + "/.fonts"

                ## fontypython dir.
                ## After an upgrade, the old_fp_dir will be deleted, making
                ## this a once-off:
                if os.path.exists(old_fp_dir):
                    try:
                        self.__upgrade_fp_dir( old_fp_dir, x_fp_dir )
                    except:
                        return #Any errors are fatal. See upstream for handling of it.

                # if new fonts exists *and* old fonts exists, then we can upgrade
                #  (new fonts *might* not exist...)
                hasnewfontsdir = "NoFontsDir" not in self.__ERROR_STATE #Rather than another exists test.
                if hasnewfontsdir and os.path.exists(old_fonts_dir):
                    ## Okay, both dirs exist.
                    ## This method ignores all errors, hence no try:
                    self.__upgrade_fonts_dir( old_fp_dir, old_fonts_dir, x_fonts_dir )


    def __try_test_make_dir( self, path, errkey ):
    """
    Test a path, make it if absent. Catch and cache errors.
    Returns nothing or raises the error.
    """
        if not os.path.exists(path):
            try:
                os.makedirs(path)
            except Exception as associated_err:
                if errkey="NoFontypythonDir":
                    e = fontybugs.NoFontypythonDir(path, associated_err)
                else:
                    e = fontybugs.NoFontsDir(path, associated_err)
                self.__ERROR_STATE[errkey] = e
                raise e # Let's use our error to communicate with the caller.

    def __raiseOrContinue(self, errkey):
        e = self.__ERROR_STATE.get( errkey, False )
        if e: raise e

    def __try_errors_in_priority_order(self):
        """Most serious first. The last one means fonts can be viewed, but not installed."""
        self.__raiseOrContinue("NoFontypythonDir")
        self.__raiseOrContinue("UpgradeFail::ImmovableFpConf")
        self.__raiseOrContinue("UpgradeFail::ImmovablePog")
        self.__raiseOrContinue("UpgradeFail::CannotRemoveOldDotFontypython")
        self.__raiseOrContinue("NoFontsDir")

    def probeNoFontsDirError(self):
        """For outside probing of missing fonts dir. E.g. see fontcontrol.py"""
        self.__raiseOrContinue("NoFontsDir")

    def probeErrors(self):
        """For outsiders to probe these errors."""
        self.__try_errors_in_priority_order()

    def appPath(self, doerrortest=False):
        """Supplies the "fontypython" application directory.
        * By default, without testing for errors."""
        if doerrortest: self.__try_errors_in_priority_order()
        return PathControl.__fp_dir

    def appConf(self, doerrortest=False):
        """Supplies paf of "fp.conf"
        * By default, without testing for errors."""
        if doerrortest: self.__try_errors_in_priority_order()
        return PathControl.__fp_dir + "/fp.conf"

    def userFontPath(self, doerrortest=False):
        """Supplies the user's "fonts" directory.
        * By default, without testing for errors."""
        if doerrortest: self.__try_errors_in_priority_order()
        return PathControl.__fonts_dir

    def home(self):
        #Not gonna bother error checking HOME
        return PathControl.__HOME

    def getPogNames(self, someotherpath=None):
        ## We pass a byte string path to os.listdir therefore this function
        ## return a LIST OF BYTE STRINGS.
        # Not going to test for path errors. Anything outside of the 
        # basic path get methods is presumed safe.
        # i.e. no self.__try_errors_in_priority_order()
        p = PathControl.__fp_dir if not someotherpath else someotherpath
        return [ f[0:-4] for f in os.listdir(p) if f.endswith(".pog") ]


    def __upgrade_fp_dir(self, old_fp, new_fp):
        """
        Seeks to:
        1. Move all .pog files in the old ~/.fontypython dir to the new.
        2. Move the fp.conf file too.
        3. Rm the old ~/.fontypython dir.
        On any error, it records and raises an UpgradeFail error.
        """

        import errno

        posserrmsg = _("Could not remove the old {} directory.\
                Please try this yourself.").format(old_fp)
        try:
            ## Start out cocky - just up and kill old_fp
            os.rmdir(old_fp)
        except OSError as ex:
            ## Ah, it's not empty: ergo upgrade.
            if ex.errno == errno.ENOTEMPTY:
                ## Move each .pog file over, or raise error.
                pl = self.getPogNames(old_fp)
                for fle in pl:
                    try:
                        oldpogpaf=os.path.join(old_fp, fle)
                        newpogpaf=os.path.hoin(new_fp, fle)
                        os.rename( oldpogpaf, newpogpaf )
                    except Exception as e:
                        ## We are going to be printing these pafs, so force them into unicode:
                        self.__ERROR_STATE["UpgradeFail::ImmovablePog"] = \
                                fontybugs.UpgradeFail(
                            _("Could not move {} to {} while trying to upgrade Fonty. \
                               Please resolve this and start me again."
                               ).format(oldpogpaf,newpogpaf), e)
                        raise

                ## Move fp.conf, or raise error.
                try: 
                    oldfpconfpaf=os.path.join(old_fp, "fp.conf")
                    newfpconfpaf=os.path.join(new_fp, "fp.conf")
                    os.rename( os.path.join(oldfpconfpaf, newfpconfpaf)
                except Exception as e:
                    self.__ERROR_STATE["UpgradeFail::ImmovableFpConf"] = fontybugs.UpgradeFail(
                        _("Could not move the config file {} to {}. \
                            Pleas resolve the problem and start me again."
                            ).format(oldfpconfpaf,newfpconfpaf), e)
                    raise
            else: # on rm old_fp -> ex.errno was some *other* OSError code...
                self.__ERROR_STATE["UpgradeFail::CannotRemoveOldDotFontypython"] = \
                        fontybugs.UpgradeFail(posserrmsg, ex)
                raise

        ## Part of the os.rmdir(old_fp) try-block
        except Exception as e: #And whatver the hell else may thwart us...
            self.__ERROR_STATE["UpgradeFail::CannotRemoveOldDotFontypython"] = \
                    fontybugs.UpgradeFail(posserrmsg, e)
            raise


        ## Now that we've moved all the guts over to the new fp path..
        ## Let's, once again, attempt to rm the old fp dir...
        try:
            os.rmdir(old_fp)
        except Exception as e:
            #Just could not kill the beast!
            self.__ERROR_STATE["UpgradeFail::CannotRemoveOldDotFontypython"] = \
                    fontybugs.UpgradeFail(posserrmsg, e)
            raise


    def __upgrade_fonts_dir(self, old_fonts_dir, new_fonts_dir):
        """
        This will re-link fonts to the new directory for all pogs that are installed.
        This method ignores all errors.
        Also, ~/.fonts ain't gonna be rmdir by me!
        """

        pl = self.getPogNames()
        if not pl: return #No pogs, nothing to do!

        for p in pl: # 'p' is a byte string.
            ipog = fontcontrol.Pog(p)
            try: #isInstalled raises various errors:
                if not ipog.isInstalled(): continue # pog is not installed, loop to next one.
            #except fontybugs.PogInvalid, eInst:
            except:
                pass # Suppress.
            else: #Okay, we have an installed pog.
                ## Let's loop its fonts and create new links in the new fonts dir:
                for fi in ipog:
                    font_filename = os.path.basename(fi.glyphpaf)
                    new_link_paf = os.path.join(new_fonts_dir, font_filename)
                    ## symlink requires fullpaf, fullpaf
                    try:
                        os.symlink(fi.glyphpaf, new_link_paf)
                    except:
                        pass # Bad mojo happened.
                    else:
                        # The font has been symlinked in the new dir
                        # Let's remove the original link in old_fonts_dir
                        old_link_paf = os.path.join(old_fonts_dir, font_filename)
                        try:
                            os.unlink(old_link_paf)
                        except:
                            pass #Meh :) 



## Oct 2009 Default Font Family (System font)
DFAM=None # Set in wxgui.py in class App()

## Ensure we have a fontypython folder and a fonts folder.
## Sept 2017
## I want to guarantee that the iPC instance exists, but there are
## also error states that make progress hard or impossible.
iPC = None # Start with None so we can catch weird paths into this module

## I Manually call this from start.py
def CreatePathControlInstance():
    global iPC
    iPC = PathControl()





##  Borrowed from wxglade.py
## The reason for this is to find the path of this file
## when it's called from an import somewhere else.
## There is no sys.argv[0] in this case.
root = __file__
if os.path.islink(root):
    root = os.path.realpath(root)
fontyroot = os.path.dirname(os.path.abspath(root))

## Where my images and things are.
mythingsdir = os.path.join(fontyroot,"things/")


## Sept 2009
class Overlaperize(object):
    '''
    If a single font is in many pogs, then we count each 'overlap' and
    control the removal of them until there are no overlaps anymore.
    i.e. When no other installed pogs are using the font, it is safe to
    remove the link (should that last pog be removed by the user).
    '''
    def __init__(self):
        self.OVERLAP_COUNT_DICT = {}
        self.DISABLE_THIS = False # In case all this makes a horrible mess : users can flip this to True....

    def inc(self,key):
        if self.DISABLE_THIS: return True

        if key in self.OVERLAP_COUNT_DICT:
            self.OVERLAP_COUNT_DICT[key] += 1
        else:
            self.OVERLAP_COUNT_DICT[key] = 2 #starts at 2 because there is already one installed.
        #self.report(key)
        return True

    def dec(self,key):
        '''
        Return True means : This font overlaps
        Return False means : This font can be uninstalled
        '''
        if self.DISABLE_THIS: return False

        if key in self.OVERLAP_COUNT_DICT:
            self.OVERLAP_COUNT_DICT[key] -= 1
            if self.OVERLAP_COUNT_DICT[key] == 0:
                del self.OVERLAP_COUNT_DICT[key]
                return False # it does NOT overlap anymore.
            else:
                #self.report(key)
                return True # It still overlaps

        # It gets if the font is totally unknown to the OVERLAP_COUNT_DICT
        return False #It therefore does NOT overlap.

    def report(self,key):
            print "%s has overlap count of %d" % (key, self.OVERLAP_COUNT_DICT[key])

    def sleep(self):
        '''Save the OVERLAP_COUNT_DICT to a file (if it has content). Called when app closes.'''
        if self.DISABLE_THIS: return

        if not self.OVERLAP_COUNT_DICT:
            self.OVERLAP_COUNT_DICT={} # Ensure there is a blank overlap_counts file!

        paf = os.path.join(iPC.appPath(),"overlap_counts")
        fr = open( paf, 'wb' ) # pickle says use 'binary' files, but only Windows makes this distinction. I use it to be safe...
        pickle.dump( self.OVERLAP_COUNT_DICT, fr, protocol=pickle.HIGHEST_PROTOCOL )
        fr.close()

    def wakeup(self):
        '''Restore the OVERLAP_COUNT_DICT from a file (if any). Called as app starts.'''
        if self.DISABLE_THIS: return

        paf = os.path.join(iPC.appPath(),"overlap_counts")
        if os.path.exists( paf ):
            fr = open( paf, "rb" )
            self.OVERLAP_COUNT_DICT = pickle.load( fr )
            fr.close()
## start it up!
Overlap = Overlaperize()
Overlap.wakeup()



## Jan 18 2008
segfonts = []# Global var

def getSegfontsList():
    """Runs (below) on startup"""
    ## On startup, open the 'segfonts' file and keep a list in RAM
    ## This file is written by the 'check' routine.
    global segfonts
    paf = os.path.join(iPC.appPath(),"segfonts")
    try:
        if os.path.exists( paf ):
            fr = open( paf, 'r' ) # byte string only ascii file
            segfonts = fr.read().split("\n")
            fr.close()
    except:
        ## CORNER CASE: Some error or other.
        raise
## Call it.		
getSegfontsList()


def checkFonts( dirtocheck, printer ):
    """
    Jan 18 2008
    Scan a tree for fonts that can cause segfaults.
    Write a file 'segfonts' and create a list 'segfonts'
    that gets checked to exclude them.

    printer is a function of some kind.

    Can be called from the cli or the gui.
    """
    global segfonts

    code = """
from PIL import ImageFont
try:
    font=ImageFont.truetype("%s", 24, 0)
    dud=font.getname()
except:
    pass
    """
    def checkForSegfault( pafbytestring ):
        ## Uses Ajaksu's idea : 17 Jan 2008. Thanks!
        segfault_I_hope = False
        ## I have ignored ALL catchable errors (see code var)
        ## This is because I want to (try to) only catch SEGFAULTS
        ## and leave all other flavours of font-related errors to
        ## the fontcontrol module -- where fonts are still useable
        ## if not visible.
        retval = subprocess.call( ["python",  '-c', code %  pafbytestring] )
        if retval != 0:
            segfault_I_hope = True
        return segfault_I_hope
    printer ( _("Checking fonts, this could take some time.") )
    printer ( _("Starting in %s:") % dirtocheck )
    printer ()
    ## dirtocheck comes-in as unicode - let's stick to byte strings:
    dirtocheck = LSP.to_bytes( dirtocheck )
    seglist = [] # our local list of newly found bad fonts
    gotsome = False
    for cwd, dirs, files in os.walk( dirtocheck ):
        printer(_("Looking in %s...") % os.path.basename(cwd) )
        ## We only want certain font files:
        fontfiles = [f for f in files if f.upper().endswith( ("TTF","TTC","PFA","PFB","OTF")) ]
        if len(fontfiles) < 1:
            printer (_("No supported fonts found there..."))
            printer()
        for file in fontfiles:
            paf = os.path.join( cwd, file )
            bad = checkForSegfault( paf )
            if bad:
                gotsome = True
                seglist.append( paf )
                printer ( " " + file ) # show it on-screen somewhere.

    if not gotsome:
        printer(_("I could not find any bad fonts."))
    ## Now write the segfonts file:
    if seglist:
        ## Add the new fonts found to the ones in global segfonts list
        for bf in seglist:
            segfonts.append(bf)
        ## Now remove duplicates
        tmp =  list( set( segfonts ) )
        segfonts = tmp
        del (tmp)
        ## Now save it.
        
        paf = os.path.join(iPC.appPath(),"segfonts")
        fw = open( paf, "w" ) # byte string ascii
        bytestring = "".join([line + "\n" for line in segfonts if line != ""])
        #print "about to write bytestring:"
        #print [bytestring]
        #print
        fw.write( bytestring )
        fw.close()

    printer()
    printer(_("The process is complete."))

def isFolder(thing):
    """True if a folder. False if not - but that does not mean it's a pog."""
    if os.path.isdir(thing): return True
    return False

def isPog(thing):
    """True if a Pog. False if not."""
    ## thing comes in as UNICODE
    ## iPC.getPogNames() is a list of BYTE STRINGS
    ## We must encode thing to a byte string to avoid warnings:
    if LSP.to_bytes( thing ) in iPC.getPogNames(): #getPogNames contains byte strings!
        return True
    if thing == "EMPTY": return True #Special case
    return False


class FPState:
    """The global vars to hold the state of the situation."""
    def __init__(self):
        ## Contains the Pog or Folder being viewed
        self.viewobject = None

        ## Refs the view object *after* the filter has been applied
        self.filteredViewObject= None

        ## Contains a Pog (or None) that is the Target
        self.targetobject = None

        ## Represents the situation in a letter code
        ## P for Pog, F for Folder, E for Empty, N for None
        self.viewpattern = ""
        self.targetpattern = ""

        ## Will be "NOTHING_TO_DO", "REMOVE" or "APPEND" (Add fonts to Pog)
        self.action = ""

        ## Can an item be ticked
        self.cantick = None

        ## The View and Target pogs chosen are the same.
        self.samepogs = False

        ## How many tick marks.
        self.numticks = 0


state = FPState() #The only instance of the state object -- app-wide


####
## Save and Load the conf file
class Configure:
    """Makes/Loads the conf file.
    Supplies size, pos, numinpage, text string and point size to other objects."""
    def __init__(self) :
        ## Private vars
        self.__dontSaveNumInPage = False

        ## PUBLIC vars :  Set some defaults:
        self.size = (800,600)
        self.pos = (10, 10)
        self.numinpage = 10
        self.text = _("Jump the lazy dog fox")
        self.points = 64
        self.lastview = "EMPTY" # a pog name or a folder path.
        self.usegui = "wxgui"
        self.max = True
        self.lastdir = iPC.home()
        ## Sept 2017
        self.leftSashMin = 180
        self.rightSashMin = 180
        ## Added Dec 2007
        self.leftSash = self.leftSashMin
        self.rightSash = self.rightSashMin
        ## Added June 2009
        self.recurseFolders = False
        ## Added Sept 2009
        self.ignore_adjustments = False
        ## Added 3 Oct 2009
        self.app_char_map = "UNSET" # A string of an app name.
        self.xdg_status={"upgraded": False,
            "xdgdatahome_fontypython" : None,
            "xdgdatahome_fonts":None}

        self.__setData()

        ## Oct 2009 -- The Character Map Controller.
        self.CMC = charmaps.CharMapController(  self.app_char_map_set )


        if os.path.exists(iPC.appConf()):
            try:
                pf = open(iPC.appConf(), "rb" ) # Binary for new pickle protocol.
                #self.__data = pickle.load( pf )
                ## I want to merge-in what may be in pickle
                self.__data.update( pickle.load( pf ) )
                pf.close()
            except:
                ## Dec 2007 : Let's try erase and rewind
                os.unlink(iPC.appConf())

        if not os.path.exists(iPC.appConf()):
            print _("No config file found, creating it with defaults.")
            self.Save()


        ## Now get them into the instance vars:
        try:
            self.size = self.__data['size']
            self.pos = self.__data['pos']
            self.numinpage = self.__data['numinpage']
            self.text = self.__data['text']
            self.points= self.__data['points']
            self.lastview = self.__data['lastview']
            self.usegui = self.__data['usegui']
            self.max = self.__data['max']
            self.lastdir = self.__data['lastdir']
            #Sept 2017
            self.leftSash = max( self.leftSashMin, self.__data['leftSash'] )
            #Sept 2017
            self.rightSash = max( self.rightSashMin, self.__data['rightSash'] )
            self.recurseFolders = self.__data['recurseFolders']
            self.ignore_adjustments = self.__data['ignore_adjustments']
            self.app_char_map = self.__data['app_char_map']
            ## We must also set our instance of the Char Map Controller:
            ##  This can be "UNSET" (default first run) or an appname
            ##  That appname may be valid or not (it may have been uninstalled...)
            self.CMC.SET_CURRENT_APPNAME(self.app_char_map)

            self.xdg_status = self.__data['xdg_status']

        except KeyError:
            ## The conf file has keys that don't work for this version, chances are it's old.
            ## Let's delete and re-make it.
            try:
                os.unlink(iPC.appConf())
            except:
                print _("The fontypython config file is damaged.\nPlease remove it and start again")
                raise SystemExit
            self.Save()

    def dontSaveNumInPage(self, flag):
        self.__dontSaveNumInPage = flag

    def __setData(self):
        self.__data = {"size" : self.size,
                                "pos" : self.pos,
                                "numinpage" : self.numinpage,
                                "text" : self.text,
                                "points" : self.points,
                                "lastview" : self.lastview,
                                "usegui" : self.usegui,
                                "max" : self.max,
                                "lastdir" : self.lastdir,
                                "leftSash" : self.leftSash,
                                "rightSash" : self.rightSash,
                                "recurseFolders": self.recurseFolders,
                                "ignore_adjustments": self.ignore_adjustments,
                                "app_char_map" : self.app_char_map,
                                "xdg_status" : self.xdg_status
                                }
    def app_char_map_set( self, x ):
        '''
        A callback from the CharMapController: when the CURRENT_APPNAME is set,
        this gets called to keep the config version of the appname current.
        '''
        self.app_char_map = x

    def Save(self) :
        #If we are NOT to save the numinpage, then fetch it from what was there before.
        if self.__dontSaveNumInPage:
            self.numinpage = self.__data["numinpage"]
        self.__setData()
        try:
            pf = open( iPC.appConf(), "wb" )
            pickle.dump(self.__data, pf, protocol = pickle.HIGHEST_PROTOCOL )
            pf.close()
        except IOError:
            print _("Could not write to the config file.")

        Overlap.sleep() #sept 2009 : Save the OVERLAP_COUNT_DICT


## Our config instance - it will have one instance across
## all the modules that use it.
config = Configure()

def instantiateViewFolder( foldername, recurse=None ):
    """
    Creates a Folder object and fills it with FontItem objects
    according to what's in the folder's path.

    This is the VIEW - i.e. what you are looking at.
    """
    if state.viewobject: del state.viewobject
    ## Default assumptions in case of raised error.
    state.viewobject = fontcontrol.EmptyView()
    state.viewpattern = "E"

    #July 2016
    #=========
    # Made recurse default to None in the def sig.
    # This has the effect of allowing THREE states to enter:
    # None, True, False
    # None means the call came from cli.py
    #  If so, we want to fetch the recurse from config -  
    #  so it becomes either T or F, depending on last state.
    #  This has stopped that initial Schroedinger's Cat state
    #  of the recurse setting.
    if recurse is None:
        recurse=config.recurseFolders
    else:
        config.recurseFolders = recurse
    #print "recurse:", recurse
    ifolder = fontcontrol.Folder(foldername, recurse) #raises : fontybugs.FolderHasNoFonts : BENIGN ERROR.
    ## Only continues if there is no problem.
    state.viewobject = ifolder
    ## Because we have a new view object, we must reset the last filteredViewObject
    state.filteredViewObject = None

    config.lastview = foldername
    state.viewpattern = "F"
    markInactive()
    flushTicks()

def instantiateViewPog( newpog_name ):
    """
    Given a Pog Name string, make a Pog object.

    This is the VIEW - i.e. what you are looking at.

    A VIEW Pog can be EMPTY. This happens on the first run when there is no config file.
    There are other arcane situations too, but I forget.
    """
##	print "COMES IN to instantiateViewPog:"
##	print "newpog_name:", newpog_name
##	print "type(newpog_name):", type(newpog_name)

    #if state.viewobject: del state.viewobject
    if state.viewobject: state.viewobject = None

    if newpog_name == "EMPTY":
        ipog = fontcontrol.EmptyView()
    else:
        ipog = fontcontrol.Pog( newpog_name )
    ## Test TARGETPOG to see if this is the same pogname
    ## The not None test is for first run - there is no targetobject yet just after cli.py calls us, so we
    ## do not want to access it or we get NoneType errors.
    if state.targetobject is not None and state.targetobject.name == newpog_name:
        state.samepogs = True
    else:
        state.samepogs = False
    ## Must gen the Pog to get a count of items:
    ## Errors raised in genList (and company): 
    ## fontybugs.PogInvalid (only valid from cli pov)
    ##
    ## We 'handle' this by NOT catching it, pass it up.
    ipog.genList()

    ## Continue if all ok.
    state.viewobject = ipog
    ## Because we have a new view object, we must reset the last filteredViewObject
    state.filteredViewObject = None

    config.lastview = newpog_name
    if len(state.viewobject) == 0:
        empty = True
        state.viewpattern = "E"
    else:
        empty = False
        state.viewpattern = "P"
        markInactive()
        flushTicks()

    #print "instantiateViewPog says viewpattern is:", state.viewpattern

    return empty # this return is only used in cli.py

def instantiateTargetPog( newpog_name ):
    """
    The app could begin with NO TARGET POG chosen.
    After that (in the gui) either a pog is chosen or NO POG is chosen (i.e. None)
    Therefore - there can NEVER BE a targetobject called EMPTY

    The CLI install/uninstall/purge DO NOT use this routine.
    """
    if state.targetobject: del state.targetobject
    ipog = fontcontrol.Pog(newpog_name)
    ## Must gen the Pog to get a count of items:
    ipog.genList() # Raises fontybugs.PogInvalid error THIS ENDS THE APP.
    ## TEST the viewobject which is the stuff being 
    ## LOOKED AT IN THE MIDDLE OF THE SCREEN (which could be a Pog OR a Folder)
    ## If it's a Pog then we may have chosen the same Pog (on the right)
    ## that we are looking at, so check that:
    state.samepogs = False
    if isinstance( state.viewobject, fontcontrol.Pog ):
        if state.viewobject.name == newpog_name:
            ## The pog clicked in the TARGET is the same as what's ALREADY selected in the VIEW
            state.samepogs = True

    quickinstalledflag = False
    if ipog.isInstalled(): quickinstalledflag  = True
    state.targetpattern = "P"
    state.targetobject = ipog
    markInactive()
    flushTicks()
    return quickinstalledflag

def markInactive():
    """
    INACTIVE means the font displayed is already inside the
    chosen target pog. So, it's not 'active', not clickable etc.

    Mark each font item as inactive, as needs-be.
    Clear the ticks.
    Sets the message to display in the fontmap.
    """
    if state.viewobject: state.viewobject.clearInactiveflags()

    if state.viewobject and state.targetobject:
        ## What's in TARGET must be inactive in VIEW

        ## pafBlist is a list of UNICODEs
        ## glyphpaf_unicode is UNICODE, so I will use it instead		
        ## because we compare it to pafBlist
        pafBlist = [i.glyphpaf_unicode for i in state.targetobject]

        for iA in state.viewobject:
            if iA.glyphpaf_unicode in pafBlist:
                iA.activeInactiveMsg = _("This font is in %s") % state.targetobject.name
                iA.inactive = True
        del pafBlist

def SetTargetPogToNone():
    state.targetobject = None
    state.targetpattern = "N"
def SetViewPogToEmpty():
    state.viewobject = fontcontrol.EmptyView()
    state.viewpattern = "E"

def flushTicks():
    for fi in state.viewobject:
        fi.ticked = False
    state.numticks = 0

def logSegfaulters( lastPaf ):
    """
    Writes a string to ~/.fontypython/lastFontBeforeSegfault
    """
    paf = os.path.join( iPC.appPath(),"lastFontBeforeSegfault")
    try:
        f = open( paf, "w" )
        lastPaf = LSP.ensure_bytes( lastPaf )
        f.write( lastPaf + "\n" )
        f.close()
    except:
        raise


