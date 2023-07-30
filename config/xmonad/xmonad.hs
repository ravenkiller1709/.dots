import XMonad

import XMonad.Util.EZConfig (additionalKeysP, mkNamedKeymap)
import XMonad.Util.Loggers
import XMonad.Util.Ungrab
import XMonad.Util.NamedScratchpad
import XMonad.Util.NamedActions
import XMonad.Util.Run (runProcessWithInput, safeSpawn, spawnPipe)
import XMonad.Util.Dmenu

import qualified Data.Map as M
import qualified XMonad.StackSet as W
import Data.Maybe (isJust)
import Data.Char (isSpace, toUpper)
import qualified Data.Text as T

import XMonad.Actions.CopyWindow (kill1)
import XMonad.Actions.WithAll (sinkAll, killAll)
import XMonad.Actions.CycleWS (Direction1D(..), moveTo, shiftTo, WSType(..), nextScreen, prevScreen)

import System.IO (hClose, hPutStr, hPutStrLn)

import XMonad.Layout.Magnifier
import XMonad.Layout.ShowWName
import XMonad.Layout.ThreeColumns

import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.ManageDocks (avoidStruts, docks, manageDocks, ToggleStruts(..))

import XMonad.ManageHook

-- | Width of the window border in pixels.
--
myborderWidth :: Dimension
myborderWidth = 0

-- | Border colors for unfocused and focused windows, respectively.
--
mynormalBorderColor, myfocusedBorderColor :: String
mynormalBorderColor  = "gray" -- "#dddddd"
myfocusedBorderColor = "white"  -- "#ff0000" don't use hex, not <24 bit safe


myScratchPads :: [NamedScratchpad]
myScratchPads = [ NS "terminal" spawnTerm findTerm manageTerm
                , NS "mocp" spawnMocp findMocp manageMocp
                , NS "calculator" spawnCalc findCalc manageCalc
                ]
  where
    spawnTerm  = myTerminal ++ " -t scratchpad"
    findTerm   = title =? "scratchpad"
    manageTerm = customFloating $ W.RationalRect l t w h
               where
                 h = 0.9
                 w = 0.9
                 t = 0.95 -h
                 l = 0.95 -w
    spawnMocp  = myTerminal2 ++ " -e mocp"
    findMocp   = title =? "mocp"
    manageMocp = customFloating $ W.RationalRect l t w h
               where
                 h = 0.9
                 w = 0.9
                 t = 0.95 -h
                 l = 0.95 -w
    spawnCalc  = "qalculate-gtk"
    findCalc   = className =? "Qalculate-gtk"
    manageCalc = customFloating $ W.RationalRect l t w h
               where
                 h = 0.5
                 w = 0.4
                 t = 0.75 -h
                 l = 0.70 -w


myTerminal = "alacritty"
myTerminal2 = "kitty"
mySoundPlayer :: String
mySoundPlayer = "ffplay -nodisp -autoexit " -- The program that will play system sounds

subtitle' ::  String -> ((KeyMask, KeySym), NamedAction)
subtitle' x = ((0,0), NamedAction $ map toUpper
                      $ sep ++ "\n-- " ++ x ++ " --\n" ++ sep)
  where
    sep = replicate (6 + length x) '-'

showKeybindings :: [((KeyMask, KeySym), NamedAction)] -> NamedAction
showKeybindings x = addName "Show Keybindings" $ io $ do
  h <- spawnPipe $ "yad --text-info --fontname=\"SauceCodePro Nerd Font Mono 12\" --fore=#46d9ff back=#282c36 --center --geometry=1200x800 --title \"XMonad keybindings\""
  --hPutStr h (unlines $ showKm x) -- showKM adds ">>" before subtitles
  hPutStr h (unlines $ showKmSimple x) -- showKmSimple doesn't add ">>" to subtitles
  hClose h
  return ()

myKeys :: XConfig l0 -> [((KeyMask, KeySym), NamedAction)]
myKeys c =
  --(subtitle "Custom Keys":) $ mkNamedKeymap c $
  let subKeys str ks = subtitle' str : mkNamedKeymap c ks in
  subKeys "Xmonad Essentials"
  [ ("M-C-r",                  addName "Recompile XMonad"        $ spawn "xmonad --recompile")
  , ("M-S-r",                  addName "Restart XMonad"          $ spawn "xmonad --restart")
  --, ("M-S-q",                addName "Quit XMonad"             $ sequence_ [spawn (mySoundPlayer ++ shutdownSound), io exitSuccess])
  --, ("M-S-q",                addName "Quit XMonad"             $ spawn "dm-logout")
  , ("M-S-c",                  addName "Kill focused window"     $ kill1)
  , ("M-S-a",                  addName "Kill all windows on WS"  $ killAll)
  --, ("M-S-<Return>",         addName "Run prompt"              $ sequence_ [spawn (mySoundPlayer ++ dmenuSound), spawn "~/.local/bin/dm-run"])
  , ("M-C-x",                  addName "Run prompt"              $ sequence_ [spawn (mySoundPlayer ++ dmenuSound), spawn "emacsclient -cF '((visibility . nil))' -e '(emacs-run-launcher)'"])
  , ("M-S-b",                  addName "Toggle bar show/hide"    $ sendMessage ToggleStruts)]

  ^++^ subKeys "Switch to workspace"
  [ ("M-1",                    addName "Switch to workspace 1"    $ (windows $ W.greedyView $ myWorkspaces !! 0))
  , ("M-2",                    addName "Switch to workspace 2"    $ (windows $ W.greedyView $ myWorkspaces !! 1))
  , ("M-3",                    addName "Switch to workspace 3"    $ (windows $ W.greedyView $ myWorkspaces !! 2))
  , ("M-4",                    addName "Switch to workspace 4"    $ (windows $ W.greedyView $ myWorkspaces !! 3))
  , ("M-5",                    addName "Switch to workspace 5"    $ (windows $ W.greedyView $ myWorkspaces !! 4))
  , ("M-6",                    addName "Switch to workspace 6"    $ (windows $ W.greedyView $ myWorkspaces !! 5))
  , ("M-7",                    addName "Switch to workspace 7"    $ (windows $ W.greedyView $ myWorkspaces !! 6))
  , ("M-8",                    addName "Switch to workspace 8"    $ (windows $ W.greedyView $ myWorkspaces !! 7))
  , ("M-9",                    addName "Switch to workspace 9"    $ (windows $ W.greedyView $ myWorkspaces !! 8))]

  ^++^ subKeys "Send window to workspace"
  [ ("M-S-1",                  addName "Send to workspace 1"    $ (windows $ W.shift $ myWorkspaces !! 0))
  , ("M-S-2",                  addName "Send to workspace 2"    $ (windows $ W.shift $ myWorkspaces !! 1))
  , ("M-S-3",                  addName "Send to workspace 3"    $ (windows $ W.shift $ myWorkspaces !! 2))
  , ("M-S-4",                  addName "Send to workspace 4"    $ (windows $ W.shift $ myWorkspaces !! 3))
  , ("M-S-5",                  addName "Send to workspace 5"    $ (windows $ W.shift $ myWorkspaces !! 4))
  , ("M-S-6",                  addName "Send to workspace 6"    $ (windows $ W.shift $ myWorkspaces !! 5))
  , ("M-S-7",                  addName "Send to workspace 7"    $ (windows $ W.shift $ myWorkspaces !! 6))
  , ("M-S-8",                  addName "Send to workspace 8"    $ (windows $ W.shift $ myWorkspaces !! 7))
  , ("M-S-9",                  addName "Send to workspace 9"    $ (windows $ W.shift $ myWorkspaces !! 8))]


  ^++^ subKeys "Diverse apps"
  [ ("M-S-z",                  addName "screensaver"      $ spawn "sclock")
  , ("M-S-s",                  addName "screenshot"       $ spawn "scrot -s")
  , ("M-f",                    addName "Launch Browser"   $ spawn "firefox")
  , ("M-<Return>",             addName "launch Terminal"  $ spawn "alacritty")
  , ("M-S-<Return>",           addName "launch emacs"     $ spawn "emacsclient -c -a 'emacs'")
  , ("<XF86AudioRaiseVolume>", addName "Volume up"        $ spawn "amixer -q sset Master 5%+")
  , ("<XF86AudioLowerVolume>", addName "Volume down"      $ spawn "amixer -q sset Master 5%-")
  , ("<XF86AudioMute>",        addName "mute sound"       $ spawn "amixer -q sset Master toggle")
  , ("M-p",                    addName "launch eMail"     $ spawn "alacritty -e neomutt")
  , ("M-d",                    addName "App Launcher"     $ spawn "dmenu_run -b")
  , ("M-m",                    addName "Music Player"     $ spawn "xterm -fs 14 -geometry 80x24+600+300 -e mocp")
  ]

 -- Toggle
  -- Scratchpad show/hide these programs. They run on a hidden workspace.
  -- When you toggle them to show, it brings them to current workspace.
  -- Toggle them to hide and it sends them back to hidden workspace (NSP).
  ^++^ subKeys "Scratchpads"
  [ ("M-a t",                  addName "Toggle scratchpad terminal            "       $ namedScratchpadAction myScratchPads "terminal")
  , ("M-a m",                  addName "Toggle scratchpad mocp                "       $ namedScratchpadAction myScratchPads "mocp")
  , ("M-<Escape>",             addName "Toggle scratchpad calculator          "       $ namedScratchpadAction myScratchPads "calculator")]

  -- Controls for mocp music player daemon (SUPER-u followed by a key)
  ^++^ subKeys "Mocp music player"
  [ ("M-u p",                  addName "mocp play"                    $ spawn "mocp --play")
  , ("M-u l",                  addName "mocp next"                    $ spawn "mocp --next")
  , ("M-u h",                  addName "mocp prev"                    $ spawn "mocp --previous")
  , ("M-u <Space>",            addName "mocp toggle pause"            $ spawn "mocp --toggle-pause")]

-- The following lines are needed for named scratchpads
    where nonNSP          = WSIs (return (\ws -> W.tag ws /= "NSP"))
          nonEmptyNonNSP  = WSIs (return (\ws -> isJust (W.stack ws) && W.tag ws /= "NSP"))


myManageHook :: ManageHook
myManageHook = composeAll
    [ className =? "Gimp"      --> doFloat
    , className =? "XTerm"     --> doFloat
    , isDialog                 --> doFloat
    , className =? "Emacs"     --> doShift "cod"
    , className =? "Alacritty" --> doShift "term"
    , className =? "firefox"   --> doShift "www"
    , className =? "kitty"     --> doShift "mus"
    ]<+> namedScratchpadManageHook myScratchPads

    
myLayout = tiled ||| Mirror tiled ||| Full ||| threeCol
  where
    threeCol = magnifiercz' 1.3 $ ThreeColMid nmaster delta ratio
    tiled    = Tall nmaster delta ratio
    nmaster  = 1     -- Default number of windows in the master pane
    ratio    = 1/2     -- Default proportion of screen occupied by master pane
    delta    = 3/100   -- Percent of screen to increment by when resizing panes


soundDir = "/home/kim/2sounds/" -- The directory that has the sound files

startupSound  = soundDir ++ "startup-01.mp3"
shutdownSound = soundDir ++ "shutdown-01.mp3"
dmenuSound    = soundDir ++ "menu-01.mp3"

myConfig = def
    { modMask = mod4Mask -- Rebind Mod to Super key
    , terminal = myTerminal
    , workspaces = myWorkspaces
    , layoutHook = showWName' myShowWNameTheme $ myLayout
    , manageHook = myManageHook
    , borderWidth = myborderWidth
    , normalBorderColor = mynormalBorderColor
    , focusedBorderColor = myfocusedBorderColor
    }

myWorkspaces = ["cod", "www", "term", "mus", "vbox", "chat", "vid", "div", "gfx"]


-- Theme for showWName which prints current workspace when you change workspaces.
myShowWNameTheme :: SWNConfig
myShowWNameTheme = def
  { swn_font              = "xft:Ubuntu:bold:size=60"
  , swn_fade              = 1.0
  , swn_bgcolor           = "#1d1f21"
  , swn_color             = "#cc6666"
  }


myXmobarPP :: PP
myXmobarPP = def
    { ppSep                = magenta " . "
    , ppTitleSanitize      = xmobarStrip
    , ppCurrent            = wrap " " "" . xmobarBorder "Bottom" "#b294bb" 2
    , ppHidden             = magenta . wrap " " ""
    , ppHiddenNoWindows    = blue . wrap " " ""
    , ppUrgent             = red . wrap (yellow "!") (yellow "!")
    , ppOrder              = \[ws, l, _, wins] -> [ws, l, wins]
    , ppExtras             = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused          = wrap (red     "[") (magenta    "]") . magenta . ppWindow
    formatUnfocused        = wrap (blue "[") (blue "]")    . blue    . ppWindow

    -- | Windows should have *some* title, which should not not exceed a
    -- sane length.
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta  = xmobarColor "#ff79c6" ""
    blue     = xmobarColor "#81a2be" ""
    white    = xmobarColor "#f8f8f2" ""
    yellow   = xmobarColor "#f1fa8c" ""
    red      = xmobarColor "#ff5555" ""
    lowWhite = xmobarColor "#bbbbbb" ""

main :: IO ()
main = xmonad
     . ewmhFullscreen
     . ewmh
     . addDescrKeys' ((mod4Mask, xK_F1), showKeybindings) myKeys
     . withEasySB (statusBarProp "xmobar" (pure myXmobarPP)) defToggleStrutsKey
     $ myConfig

        

