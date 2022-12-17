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

myTerminal    = "kitty"   :: String 
myBorderWidth = 2         :: Dimension
myNormColor   = "#2b2c2a" :: String
myFocusColor  = "#d8ded3" :: String

myKeys :: [(String, X())]

myKeys =
  [

  -- programs -- 
    ("M-m", spawn "firefox"), -- firefox
    ("M-f", spawn "thunar"), -- file system

  -- utilities -- 
    ("M-p", spawn "rofi -show drun"), -- rofi
    ("M-s", spawn "scrot -u"), -- screenshot
    ("M-S-s", spawn "scrot -s"), --screenshot 
    ("M-r", spawn "redshift -O 4000"), -- red screen
    ("M-S-r", spawn "redshift -x"), -- red screen

  -- actions 
    ("<XF86AudioRaiseVolume>", spawn "amixer sset Master 5+"), -- vol up
    ("<XF86AudioLowerVolume>", spawn "amixer sset Master 5-"), -- vol down
    ("M-<XF86AudioRaiseVolume>", spawn "brightnessctl set 5%+"), -- brightness up
    ("M-<XF86AudioLowerVolume>", spawn "brightnessctl set 5%-"), -- brightness down
    ("<XF86AudioNext>", spawn "playerctl next"), -- mute / unmute
    ("<XF86AudioPrev>", spawn "playerctl previous"), -- mute / unmute
    ("<XF86AudioPlay>", spawn "playerctl play-pause"), -- mute / unmute
    ("M-d", spawn "bash ~/.config/eww/scripts/dashboard.sh") -- brightness down

  ]

myLayoutHook = 
  avoidStruts $ 
  gaps [(U,15), (D,15), (R,15), (L,15)] $ Tall 1 (3/100) (1/2) 
  ||| Grid
  ||| Full

myStartupHook :: X()
myStartupHook = do

-- keyboard layout
  spawnOnce "setxkbmap es"

----------------------------------
-------------- main --------------
----------------------------------

main :: IO ()
main = xmonad $ ewmhFullscreen $ ewmh $ def 
  {
    terminal            = myTerminal,
    borderWidth         = myBorderWidth,
    normalBorderColor   = myNormColor,
    focusedBorderColor  = myFocusColor,
    layoutHook          = myLayoutHook,
    manageHook          = manageHook def <+> manageDocks,
    startupHook         = myStartupHook
  }
  `additionalKeysP` myKeys
