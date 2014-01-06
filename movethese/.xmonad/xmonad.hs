import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Grid
import XMonad.Layout.Spiral
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances

import Text.Regex.Posix ((=~))

q ~? x = fmap (=~ x) q

myModMask = mod4Mask
myWorkspaces = ["1:code","2","3","4:web","5","6","7","8","9"]
myTerminal = "urxvt"
myLayout = mkToggle (single MIRROR) ( spiral (6/7) ||| Grid ||| tiled ||| Full )
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio
     -- The default number of windows in the master pane
     nmaster = 1
     -- Default proportion of screen occupied by master pane
     ratio   = 1/2
     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

myManageHook = composeAll
    [ resource =? "sun-awt-X11-XWindowPeer" <&&> title ~? "win[0-9]+" --> doIgnore
    , className =? "Google-chrome" --> doFloat ]

main = do
   xmonad $ gnomeConfig {
     manageHook = myManageHook <+> manageHook gnomeConfig
     , startupHook = setWMName "LG3D"
     , logHook = ewmhDesktopsLogHook
     , modMask = myModMask
     , terminal = myTerminal
     , workspaces = myWorkspaces
     , layoutHook = myLayout
     }`additionalKeys`
     [ ((mod4Mask, xK_p), spawn "dmenu_run -b")
        -- resizing the master/slave ratio
        , ((mod4Mask,               xK_h     ), sendMessage Shrink) -- %! Shrink the master area
        , ((mod4Mask .|. shiftMask, xK_h     ), sendMessage Expand) -- %! Expand the master area
        -- toggle layout
        , ((mod4Mask,               xK_x     ), sendMessage $ Toggle MIRROR)
     ]
