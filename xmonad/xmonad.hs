----------------------------------
------------ imports -------------
----------------------------------

import XMonad

import XMonad.Util.EZConfig(additionalKeysP)
import XMonad.Util.SpawnOnce 

import XMonad.Layout.Gaps
import XMonad.Layout.Grid

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.EwmhDesktops

----------------------------------
----------- variables ------------
----------------------------------

myTerminal = "kitty" :: String 
myBorderWidth = 3 :: Dimension
myNormColor = "#928374" ::String
myFocusColor = "#ebdbb2" ::String

myKeys ::  [(String, X ())]
myKeys =
  [

  -- programs -- 
    ("M-m", spawn "firefox"), -- firefox
    ("M-f", spawn "thunar"), -- file system

  -- utilities -- 
    ("M-p", spawn "~/.config/rofi/launchers/type-4/launcher.sh"), -- rofi
    ("M-s", spawn "scrot"), -- screenshot
    ("M-S-s", spawn "scrot -s"), --screenshot 
    ("M-r", spawn "redshift -O 4000"), -- red screen
    ("M-S-r", spawn "redshift -x"), -- red screen
    ("M-e", spawn "~/.config/rofi/powermenu/type-4/powermenu.sh"), -- powermenu

  -- actions 
    ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ +2%"), -- vol up
    ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ -2%"), -- vol down
    ("M-<XF86AudioRaiseVolume>", spawn "brightnessctl set 2%+"), -- brightness up
    ("M-<XF86AudioLowerVolume>", spawn "brightnessctl set 2%-"), -- brightness down
    ("<XF86AudioMute>", spawn "pactl set-sink-input-mute 2 toggle") -- mute / unmute

  ]

myLayoutHook = 
  avoidStruts $ 
  gaps [(U,15), (D,15), (R,15), (L,15)] $ Tall 1 (3/100) (1/2) 
  ||| Grid
  ||| Full

myStartupHook :: X ()
myStartupHook = do
-- my bar
  spawnOnce "eww open bar_1"

-- bar workspaces
  spawnOnce "bash ~/.config/eww/workspace.sh"

-- keyboard layout
  spawnOnce "setxkbmap es"

----------------------------------
-------------- main --------------
----------------------------------

main :: IO ()
main = xmonad $ ewmhFullscreen $ ewmh $ def 
  {
    terminal = myTerminal,
    borderWidth = myBorderWidth,
    normalBorderColor = myNormColor,
    focusedBorderColor = myFocusColor,
    layoutHook = myLayoutHook,
    manageHook = manageHook def <+> manageDocks,
    startupHook = myStartupHook
  }
  `additionalKeysP` myKeys


