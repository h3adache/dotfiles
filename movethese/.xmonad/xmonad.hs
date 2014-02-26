import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.ManageDocks

import Text.Regex.Posix ((=~))

q ~? x = fmap (=~ x) q
myManageHook = resource =? "sun-awt-X11-XWindowPeer" <&&> title ~? "win[0-9]+" --> doIgnore
defaultModMask = mod4Mask
main = do
   xmonad $ gnomeConfig {
     manageHook = myManageHook <+> manageHook gnomeConfig
     , startupHook = setWMName "LG3D"
     , logHook = ewmhDesktopsLogHook
     , modMask = defaultModMask
     , terminal = "urxvt"
     }`additionalKeys`
     [ ((defaultModMask, xK_p), spawn "dmenu_run -b")
        -- resizing the master/slave ratio
        , ((defaultModMask,               xK_h     ), sendMessage Shrink) -- %! Shrink the master area
        , ((defaultModMask .|. shiftMask, xK_h     ), sendMessage Expand) -- %! Expand the master area
     ]
