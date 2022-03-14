import qualified Data.Map                      as M
import           Data.Monoid
import           System.Exit
import           XMonad
import           XMonad.Actions.CycleWS
import           XMonad.Config.Desktop
import           XMonad.Hooks.EwmhDesktops
import           XMonad.Hooks.ManageDocks       ( avoidStruts
                                                , docks
                                                , ToggleStruts(ToggleStruts)
                                                )
import           XMonad.Layout.LayoutModifier   ( ModifiedLayout )
import           XMonad.Layout.NoBorders        ( smartBorders )
import           XMonad.Layout.Spacing
import           XMonad.Layout.ThreeColumns     ( ThreeCol(ThreeColMid) )
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
  layouts = tiled ||| Mirror tiled ||| Full ||| threeCol 
  threeCol = ThreeColMid 1 (3 / 100) (1 / 2)
  tiled = Tall 1 0.05 0.515
{-
myLayout =
  fullscreenFull
    $   D.avoidStruts
    $   smartBorders
    $   toggleLayouts Full
    $   tiled
    ||| Mirror tiled
 where
  tiled   = Tall 1 0.05 0.515
-}



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
       , ((modm, xK_t)                  , withFocused $ windows . W.sink)
       , ((modm, xK_d)                  , sendMessage (IncMasterN 1))
       , ((modm, xK_i)                  , sendMessage (IncMasterN (-1)))
       , ((modm, xK_b)                  , sendMessage ToggleStruts)
       , ((modm, xK_f)                  , sendMessage $ JumpToLayout "Full")
       , ((modm, xK_q)                  , spawn "xmonad --restart")
       , ((modm, xK_Tab)                , toggleWS)
       , ((modm .|. shiftMask, xK_q)    , spawn "lxqt-leave")
       , ( (modm .|. shiftMask, xK_h)
         , spawn ("echo \"" ++ help ++ "\" | xmessage -file -")
         )
       ]
    ++ [ ((m .|. modm, k), windows $ f i)
       | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
       , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
       ]
    ++ [ ((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
       | (key, sc) <- zip [xK_w, xK_e, xK_r] [0 ..]
       , (f  , m ) <- [(W.view, 0), (W.shift, shiftMask)]
       ]




help :: String
help = unlines
  [ "The default modifier key is 'Super'. Default keybindings:"
  , ""
  , "-- launching and killing programs"
  , "mod-Shift-h      Launch this help window"
  , "mod-n            Launch terminal"
  , "mod-p            Launch dmenu"
  , "mod-c            Launch clipmenu"
  , "mod-Shift-c      Close/kill the focused window"
  , "mod-Space        Rotate through the available layout algorithms"
  , "mod-Shift-Space  Reset the layouts on the current workSpace to default"
  , "mod-Shift-n      Resize/refresh viewed windows to the correct size"
  , ""
  , "-- move focus up or down the window stack"
  , "mod-j          Move focus to the next window"
  , "mod-k          Move focus to the previous window"
  , "mod-Backspace  Move focus to the master window"
  , ""
  , "-- modifying the window order"
  , "mod-Return   Swap the focused window and the master window"
  , "mod-Shift-j  Swap the focused window with the next window"
  , "mod-Shift-k  Swap the focused window with the previous window"
  , ""
  , "-- resizing the master/slave ratio"
  , "mod-h  Shrink the master area"
  , "mod-l  Expand the master area"
  , ""
  , "-- floating layer support"
  , "mod-t  Push window back into tiling; unfloat and re-tile it"
  , ""
  , "-- increase or decrease number of windows in the master area"
  , "mod-d   Increment the number of windows in the master area"
  , "mod-d   Deincrement the number of windows in the master area"
  , ""
  , "-- quit, or restart"
  , "mod-Shift-q  Quit xmonad"
  , "mod-q        Restart xmonad"
  , "mod-[1..9]   Switch to workSpace N"
  , ""
  , "-- Workspaces & screens"
  , "mod-Shift-[1..9]   Move client to workspace N"
  , "mod-{w,e,r}        Switch to physical/Xinerama screens 1, 2, or 3"
  , "mod-Shift-{w,e,r}  Move client to screen 1, 2, or 3"
  , ""
  , "-- Mouse bindings: default actions bound to mouse events"
  , "mod-button1  Set the window to floating mode and move by dragging"
  , "mod-button2  Raise the window to the top of the stack"
  , "mod-button3  Set the window to floating mode and resize by dragging"
  ]
