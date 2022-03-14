import qualified Data.Map                      as M
import           Data.Monoid
import           System.Exit
import           XMonad
import           XMonad.Actions.CycleWS
import           XMonad.Config.Desktop
import           XMonad.Hooks.EwmhDesktops
import           XMonad.Hooks.ManageDocks       ( ToggleStruts(ToggleStruts)
                                                , avoidStruts
                                                , docks
                                                )
import           XMonad.Layout.LayoutModifier   ( ModifiedLayout )
import           XMonad.Layout.NoBorders        ( smartBorders )
import           XMonad.Layout.ResizableThreeColumns
                                                ( ResizableThreeCol(..), MirrorResize(..) )
import           XMonad.Layout.ResizableTile    ( MirrorResize(..)
                                                , ResizableTall(..)
                                                )
import           XMonad.Layout.SimplestFloat    ( simplestFloat )
import           XMonad.Layout.Spacing
import           XMonad.Layout.ThreeColumns     ( ThreeCol(..) )
import           XMonad.Layout.ToggleLayouts
import qualified XMonad.StackSet               as W
import           XMonad.Util.Cursor
import           XMonad.Util.Run                ( spawnPipe )

main = do
  xmonad $ ewmhFullscreen . ewmh . docks $ desktopConfig
    { terminal           = myTerminal
    , modMask            = myModMask
    , keys               = myKeys
    , normalBorderColor  = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    , borderWidth        = myBorderWidth
    , layoutHook         = myLayout
    }


myLayout = (smartBorders . avoidStruts) layouts
 where
  layouts  = tiled ||| threeCol ||| Full ||| Mirror tiled ||| simplestFloat
  tiled    = ResizableTall 1 (1 / 20) (103/200) []
  threeCol = ThreeCol 1 (1 / 20) (103/200) 


myTerminal = "alacritty"
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True
myClickJustFocuses :: Bool
myClickJustFocuses = False
myBorderWidth = 2
myModMask = mod4Mask
myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
myNormalBorderColor = "#2E3440"
myFocusedBorderColor = "#5E81AC"
myStartupHook = setDefaultCursor xC_left_ptr

myKeys conf@XConfig { XMonad.modMask = modm } =
  M.fromList
    $  [ ((modm, xK_n)                  , spawn $ XMonad.terminal conf)
       , ((modm, xK_p)                  , spawn "dmenu_run")
       , ((modm, xK_c)                  , spawn "clipmenu")
       , ((modm .|. shiftMask, xK_c)    , kill)
       , ((modm, xK_space)              , sendMessage NextLayout)
       , ((modm .|. shiftMask, xK_space), setLayout $ XMonad.layoutHook conf)
       , ((modm .|. shiftMask, xK_n)    , refresh)
       , ((modm, xK_j)                  , windows W.focusDown)
       , ((modm, xK_k)                  , windows W.focusUp)
       , ((modm, xK_BackSpace)          , windows W.focusMaster)
       , ((modm, xK_Return)             , windows W.swapMaster)
       , ((modm .|. shiftMask, xK_j)    , windows W.swapDown)
       , ((modm .|. shiftMask, xK_k)    , windows W.swapUp)
       , ((modm, xK_h)                  , sendMessage Shrink)
       , ((modm, xK_l)                  , sendMessage Expand)
       , ((modm .|. shiftMask, xK_h)    , sendMessage MirrorExpand)
       , ((modm .|. shiftMask, xK_l)    , sendMessage MirrorShrink)
       , ((modm, xK_t)                  , withFocused $ windows . W.sink)
       , ((modm, xK_d)                  , sendMessage (IncMasterN 1))
       , ((modm, xK_i)                  , sendMessage (IncMasterN (-1)))
       , ((modm, xK_b)                  , sendMessage ToggleStruts)
       , ((modm, xK_f)                  , sendMessage $ JumpToLayout "Full")
       , ((modm, xK_q)                  , spawn "xmonad --restart")
       , ((modm, xK_Tab)                , toggleWS)
       , ((modm .|. shiftMask, xK_q)    , spawn "lxqt-leave")
       ]
    ++ [ ((m .|. modm, k), windows $ f i)
       | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
       , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
       ]
    ++ [ ((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
       | (key, sc) <- zip [xK_w, xK_e, xK_r] [0 ..]
       , (f  , m ) <- [(W.view, 0), (W.shift, shiftMask)]
       ]



