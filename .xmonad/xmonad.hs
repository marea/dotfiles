------------------------------------------------------------------------
-- Imports:
import Data.Monoid
import System.Exit
import XMonad
import XMonad.Actions.FloatSnap
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Gaps
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Spacing
import XMonad.Util.Cursor
import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import XMonad.Hooks.EwmhDesktops (ewmh)
import MyColors

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

------------------------------------------------------------------------
-- Settings:
myTerminal      = "alacritty"
myBorderWidth   = 1
myModMask       = mod4Mask
myWorkspaces    = ["1","2","3","4","5","6","7","8","9"]
myNormalBorderColor  = myColorBorder
myFocusedBorderColor = myColorFocus

-- dmenu:
-- "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbordercolor, "-sf", selfgcolor
myDmenuFont = "GoMono Nerd Font Mono:pixelsize=17"
myDmenuCommand = "dmenu_run -b -fn '" ++ myDmenuFont ++ "' -nb '" ++
  myColorBorder ++ "' -nf '" ++ myColorFocus ++ "' -sb '" ++ myColorFocus ++
  "' -sf '" ++ myColorBorder ++ "' -h 25"

------------------------------------------------------------------------
-- Key Bindings:
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
    , ((modm,               xK_r     ), spawn myDmenuCommand)

    , ((modm .|. shiftMask, xK_q     ), kill)

    , ((modm,               xK_space ), sendMessage NextLayout)
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    , ((modm,               xK_j     ), windows W.focusDown)
    , ((modm,               xK_k     ), windows W.focusUp  )
    , ((modm,               xK_m     ), windows W.focusMaster  )
    , ((modm,               xK_Return), windows W.swapMaster)
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )
    , ((modm,               xK_h     ), sendMessage Shrink)
    , ((modm,               xK_l     ), sendMessage Expand)
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

    , ((modm              , xK_b     ), sendMessage ToggleStruts)
    , ((modm,               xK_n     ), refresh)

    , ((modm .|. shiftMask, xK_e     ), io (exitWith ExitSuccess))
    , ((modm .|. shiftMask, xK_r     ), spawn "xmonad --recompile; xmonad restart")
    ]
    ++

    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

------------------------------------------------------------------------
-- Mouse bindings:
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    [((modm,               button1), (\w -> focus w >> mouseMoveWindow w >>
      afterDrag (snapMagicMove (Just 15) (Just 15) w)))
    , ((modm .|. shiftMask, button1), (\w -> focus w >> mouseMoveWindow w >>
      afterDrag (snapMagicResize [L,R,U,D] (Just 15) (Just 15) w)))
    , ((modm,               button3), (\w -> focus w >> mouseResizeWindow w >>
      afterDrag (snapMagicResize [R,D] (Just 15) (Just 15) w)))
    ]


------------------------------------------------------------------------
-- Layouts:
gapSize=15
myLayout = avoidStruts(
  onWorkspace "1" (noBorders Full) $ (
    (spacingRaw False (Border gapSize 0 gapSize 0) True
      (Border 0 gapSize 0 gapSize) True $ tiled
      ||| Mirror tiled) ||| noBorders Full ))
  where
     tiled   = Tall nmaster delta ratio
     nmaster = 1
     ratio   = 1/2
     delta   = 3/100

------------------------------------------------------------------------
-- Window rules:
myManageHook = composeAll
    [ resource  =? "desktop_window" --> doIgnore ]

------------------------------------------------------------------------
-- Event handling
myEventHook = mempty

------------------------------------------------------------------------
-- Status bars and logging
myLogHook = return ()

------------------------------------------------------------------------
-- Startup hook
myStartupHook = do
  spawnOnce "~/.fehbg &"
  spawnOnce "picom &"
  spawnOnce "megasync &"
  spawnOnce "nm-applet &"
  spawnOnce "pa-applet &"
  spawnOnce "setxkbmap -option compose:ralt &"
  spawnOnce "unclutter -idle 3"
  spawnOnce "polybar default && xdo lower -N Polybar &"
  setDefaultCursor xC_left_ptr

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.
main = do
  xmonad . docks . ewmh $ defaults

defaults = def {
        terminal           = myTerminal,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,
        keys               = myKeys,
        mouseBindings      = myMouseBindings,
        layoutHook         = myLayout,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
    }
