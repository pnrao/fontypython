##	Fonty Python Copyright (C) 2017 Donn.C.Ingle
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

import wx
import fpsys

## Oct 2017 Default Font Family (System font)
## And colours from the user's gui settings:
## Setup in showMain() in wxgui.py
SYSFONT={}
SYSCOLS={}
HTMLCOLS={}
def setup_fonts_and_colours():
    SYSCOLS.update(
    {"dark"  : wx.SystemSettings.GetColour(wx.SYS_COLOUR_BTNTEXT),
     "gray"  : wx.SystemSettings.GetColour(wx.SYS_COLOUR_GRAYTEXT),
     "shadow": wx.SystemSettings.GetColour(wx.SYS_COLOUR_BTNSHADOW),
    "neutral": wx.SystemSettings.GetColour(wx.SYS_COLOUR_BACKGROUND),
     "light" : wx.SystemSettings.GetColour(wx.SYS_COLOUR_WINDOW),
  "highlight": wx.SystemSettings.GetColour(wx.SYS_COLOUR_HIGHLIGHT),
    })

    ##Colours for things that use html
    hcol = SYSCOLS["highlight"]
    HTMLCOLS.update({
    "logotype":hcol,
    "dark"    :SYSCOLS["dark"],
    "medium"  :SYSCOLS["gray"],
    "bg"      :SYSCOLS["neutral"],
    "heading1":hcol,
    "heading2":hcol,
    "heading3":hcol,
    "heading4":hcol,
    "heading5":hcol,
    "heading6":hcol,
    })
    # I need them all in #RRGGBB format:
    for k,v in HTMLCOLS.iteritems():
        HTMLCOLS[k] = v.GetAsString(flags=wx.C2S_HTML_SYNTAX)

    # Going with the sys colours.
    #HTMLCOLS.update({"fontyblue":u"#768b94"})
    
    wxfont = wx.SystemSettings.GetFont(wx.SYS_DEFAULT_GUI_FONT)
    # Point sizes are integers.
    ps = wxfont.GetPointSize()
    # I had this in SYSFONT:
    #"font"            : wxfont, 
    # But it acts weirdly later on.
    # Do not store refs to a font...
    SYSFONT.update(
       {
        "points_tiny"     : ps-2,
        "points_small"    : ps-1,
        "points_normal"   : ps,
        "points_x_normal" : ps+1,
        "points_large"    : ps+2,
        "points_x_large"  : ps+5,
        "points_xx_large" : ps+8,
        "points_xxx_large": ps*2,
        })

class AutoWrapStaticText(wx.PyControl):
    """
    By Robin Dunn
    Under hackery. Not working right now.
    :(
    """
    def __init__(self, parent,
            ustr,
            point_size,
            weight = wx.FONTWEIGHT_NORMAL,
            align = wx.ALIGN_LEFT,
            ellip = None):

        s = align
        if ellip: s |= ellip
        
        pos = wx.DefaultPosition

        self.p = parent
        wx.PyControl.__init__(self, parent, -1,
                wx.DefaultPosition,
                wx.DefaultSize, wx.NO_BORDER,
                wx.DefaultValidator)#, name)

        self.st = wx.StaticText(self, -1, ustr, style = s )
        
        f = wx.SystemSettings.GetFont(wx.SYS_DEFAULT_GUI_FONT)
        f.SetPointSize(SYSFONT[point_size])
        f.SetWeight(weight)    

        self.st.SetFont( f )       

        self._orig_ustr = ustr # save the unwrapped text
        self._wrapped_str = ustr



        # Measure the string once, to ge a line height.
        f = self.st.GetFont()
        dc = wx.ScreenDC()
        dc.SetFont(f)
        w,h,lh = dc.GetMultiLineTextExtent(ustr,f)
        self._lineheight = lh

        self.sizer = wx.BoxSizer(wx.VERTICAL)
        self.sizer.Add( self.st, 0, wx.EXPAND )
        self.SetSizer( self.sizer )
        self.Fit()

        self._Rewrap()
        self.Bind(wx.EVT_SIZE, self.OnSize)
       

    def SetLabel(self, ustr):
        #print "## SetLabel runs with new string:",ustr
        self._orig_ustr = ustr
        self._Rewrap()
        sz = self._lh()
        self.st.SetSize(sz)#self._lh())
        self.sizer.Clear()
        self.sizer.Add( self.st, 0, wx.EXPAND )
        #self.Layout()
        self.Fit()
        self.p.Fit()
        #print "Before call _lh:",self.GetSize()
        #sz = self._lh()
        #print "_lh sz:",sz
        #self.st.SetSize(sz)#self._lh())
        #print "After SetSize:",self.GetSize()
        #self.sizer.SetSizeHints(self)
        #self.Layout()
        #self.p.Fit()#Refresh()
    def GetLabel(self):
        return self._orig_ustr

    def SetFont(self, font):
        self.st.SetFont(font)
        self._Rewrap()
    def GetFont(self):
        return self.st.GetFont()


    def OnSize(self, evt):
        #print "@@ onsize runs"
        self.st.SetSize( self.GetSize() )#[0], 17) )
        self._Rewrap()
        #evt.Skip()

    def _Rewrap(self):
        self.st.Freeze()
        self.st.SetLabel(self._orig_ustr)
        self.st.Wrap(self.GetSize().width)
        self._wrapped_str = self.st.GetLabel()
        self.st.Thaw()

    def _lh(self):
        s = self._wrapped_str
        nlc = s.count("\n") + 1
        h = nlc * self._lineheight
        #print s
        sz = ( self.p.GetSize()[0], h )
        #print "measuring: sz", sz
        #print "***"
        return sz

    def DoGetBestSize(self):
        # I return the width of parent and
        # the lineheight times number of newlines
        # works ok.
        #print 
        #print "***************************"
        #print "***DoGetBestSize runs for:", self._orig_ustr
        #print "**************************"
        return self._lh()



def xlabel(parent, 
        ustr,
        size = None,
        weight=None,
        align = wx.ALIGN_LEFT,
        ellip = None):

    s = align
    if ellip: s |= ellip

    lbl = wx.StaticText( parent, -1, ustr, style = s)

    f = wx.SystemSettings.GetFont(wx.SYS_DEFAULT_GUI_FONT)
    f.SetPointSize(SYSFONT[size])
    f.SetWeight(weight)    

    lbl.SetFont( f )
    return lbl

def parar( parent, ustr, size="points_normal" ):
    return xlabel( parent, ustr, size,
            weight=wx.FONTWEIGHT_NORMAL,
            align=wx.ALIGN_RIGHT )

def para( parent, ustr, size="points_normal" ):
    return xlabel( parent, ustr, size,
            weight=wx.FONTWEIGHT_NORMAL )

def label( parent, ustr, align = wx.ALIGN_LEFT, ellip = None, autowrap = False ):
    if autowrap: return AutoWrapStaticText( parent, ustr,
                        point_size = "points_normal",
                        weight=wx.FONTWEIGHT_NORMAL,
                        align = align, ellip=ellip )        
    return xlabel( parent, ustr, size="points_normal",
           weight=wx.FONTWEIGHT_NORMAL,
           align = align, ellip=ellip)

def wrap_label( parent, ustr, align = wx.ALIGN_LEFT, ellip = None):
    return AutoWrapStaticText( parent, ustr,
            point_size = "points_normal",
            weight=wx.FONTWEIGHT_NORMAL,
            align = align, ellip=ellip )

def large_label( parent, ustr ):
    return xlabel( parent, ustr, size="points_x_normal",
            weight=wx.FONTWEIGHT_NORMAL )

def small_label( parent, ustr ):
    return xlabel( parent, ustr, size="points_small",
            weight=wx.FONTWEIGHT_NORMAL )

def boldlabel( parent, ustr ):
    return xlabel( parent, ustr, size="points_x_normal",
            weight=wx.FONTWEIGHT_BOLD )

def h0( parent, ustr ):
    return xlabel( parent, ustr, "points_xxx_large",
            wx.FONTWEIGHT_BOLD )

def h1( parent, ustr, ellip = None ):
    return xlabel( parent, ustr, size="points_large",
            weight=wx.FONTWEIGHT_BOLD, ellip = ellip )

def h2( parent, ustr ):
    return xlabel( parent, ustr, size="points_large",
            weight=wx.FONTWEIGHT_NORMAL )


def wxbmp( filename ):
    return wx.Bitmap( fpsys.mythingsdir + filename+".png", 
            wx.BITMAP_TYPE_PNG )

def icon(parent, filename):
    b = wxbmp( filename )
    i = wx.StaticBitmap( parent, -1, b )
    return i
