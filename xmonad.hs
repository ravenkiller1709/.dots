import XMonad

import XMonad.Layout.ThreeColumns
import XMonad.Layout.Magnifier
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Util.Loggers

import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers

import Graphics.X11.ExtraTypes.XF86

main :: IO ()
main = xmonad
     . ewmhFullscreen
     . ewmh
     . withEasySB (statusBarProp "xmobar" (pure myXmobarPP)) defToggleStrutsKey
     $ myConfig

myConfig = def
     { modMask            = mod4Mask     -- Rebind Mod to the Super key
     , layoutHook         = myLayoutHook     -- Use custom layouts
     , workspaces         = myWorkspaces
     , normalBorderColor  = mynormalBorderColor
     , focusedBorderColor = myfocusedBorderColor
     , manageHook         = myManageHook -- Match on certain windows
     }
     `additionalKeysP`
       [ ("M-S-z",                    spawn "xsreensaver-command -lock"               )
       , ("M-C-s",                    unGrab *> spawn "scrot -s"                      )
       , ("M-e"  ,                    spawn "emacs"                                   )
       , ("M-S-e",                    spawn "emacs ~/.config/xmonad/xmonad.hs"        )       
       , ("M-d"  ,                    spawn "dmenu_run"                               )
       , ("M-w"  ,                    spawn "firefox"                                 )
       , ("M-l"  ,                    spawn "alacritty -e alsamixer"                  )
       , ("M-p"  ,                    spawn "alacritty -e neomutt"                    )
       , ("M-C-g",                    spawn "alacritty -e $HOME/.scripts/gpt.sh"      )       
       , ("M-m"  ,                    spawn "st -e ncmpcpp"                           )              
       , ("<XF86AudioRaiseVolume>",   spawn "amixer -q sset Master 5%+"               )
       , ("<XF86AudioLowerVolume>",   spawn "amixer -q sset Master 5%-"               )
       , ("<XF86AudioMute>",          spawn "amixer -q sset Master toggle"            )
       , ("M-S-w"  ,                  spawn "alacritty -e $HOME/.scripts/pickwall.sh" )
       , ("M-S-q"  ,                  spawn "$HOME/.local/bin/sysact"                 )
       , ("M-S-<Space>",              sendMessage ToggleStruts                        )
       ]

mynormalBorderColor, myfocusedBorderColor :: String
mynormalBorderColor  = "gray" -- "#dddddd"
myfocusedBorderColor = "white"  -- "#ff0000" don't use hex, not <24 bit safe


myWorkspaces = ["www", "dev", "sys", "pix", "chat", "vid", "mus", "gfx", "vbox"]


myLayoutHook = avoidStruts (tall ||| Full ||| threeCol ||| tiled)
                  where
                    tall     = Tall 1 (3/100) (1/2)
                    threeCol = magnifiercz' 1.3 $ ThreeColMid nmaster delta ratio
                    tiled    = Tall nmaster delta ratio
                    nmaster  = 1       -- Default number of windows in the master pane
                    ratio    = 1/2     -- Default proportion of screen occupied by master pane
                    delta    = 3/100   -- Percent of screen to increment by when resizing panes

myManageHook :: ManageHook
myManageHook = composeAll
    [ className =? "Gimp"    --> doFloat
    , isDialog               --> doFloat
    , className =? "firefox" --> doShift "www"
    , className =? "XTerm"   --> doShift "dev"
    , className =? "Emacs"   --> doShift "sys"
    , className =? "St"      --> doShift "mus"
    ]

    
myXmobarPP :: PP
myXmobarPP = def
     { ppSep              = magenta " . "
     , ppTitleSanitize    = xmobarStrip
     , ppCurrent          = wrap " " "" . xmobarBorder "Top" "#8be9fd" 2
     , ppHidden           = white . wrap " " ""
     , ppHiddenNoWindows  = lowWhite . wrap " " ""
     , ppUrgent           = red . wrap (yellow "|") (yellow "|")
     , ppOrder            = \[ws, l, _, wins] -> [ws, l, wins]
     , ppExtras           = [logTitles formatFocused formatUnfocused]
     }
   where
     formatFocused   = wrap (white     "[") (white      "]") . magenta . ppWindow
     formatUnfocused = wrap (lowWhite  "[") (lowWhite   "]") . blue    . ppWindow

     -- / Windows should have *some* title, which should not not exceed a
     -- sane length
     ppWindow :: String -> String
     ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

     blue, lowWhite, magenta, red, white, yellow :: String -> String
     magenta  = xmobarColor "#ff79c6" ""
     blue     = xmobarColor "#bd93f9" ""
     white    = xmobarColor "#f8f8f2" ""
     yellow   = xmobarColor "#f1fa8c" ""
     red      = xmobarColor "#ff5555" ""
     lowWhite = xmobarColor "#bbbbbb" ""


 
