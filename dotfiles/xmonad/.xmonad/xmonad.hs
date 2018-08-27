import XMonad
import XMonad.Hooks.DynamicLog

main
  = xmonad =<< xmobar myConfig

myConfig
  = def
      { modMask = mod4Mask
      , terminal = "urxvt"
      }
