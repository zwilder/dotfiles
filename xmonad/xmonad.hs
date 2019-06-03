import XMonad
import XMonad.Operations
import System.IO
import System.Exit
import XMonad.Util.Run
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.UrgencyHook
import XMonad.Util.EZConfig(additionalKeys)

myTerminal = "gnome-terminal"
myWorkspaces = ["1:Main", "2:Web", "3", "4", "5"]
myXMonadBar = "dzen2 -dock -p -ta l -x 0 -w 900"
myStatusBar = "conky -c /home/zwilder/.xmonad/data/conky/dzen | dzen2 -dock -p -ta r -x 900 -w 1200"

main = do
    dzenLeftBar <- spawnPipe myXMonadBar
    dzenRightBar <- spawnPipe myStatusBar
    xmonad $ docks def
        { terminal              = myTerminal
        , workspaces            = myWorkspaces
        , logHook               = myLogHook dzenLeftBar
        , layoutHook            = avoidStruts $ layoutHook def
        , manageHook            = manageHook def <+> manageDocks
        -- , modMask               = mod4Mask
        , borderWidth           = 1
        , normalBorderColor     = "#000000"
        , focusedBorderColor    = "#A6A6A6"
        -- , focusedBorderColor    = "#CB4B16"
} `additionalKeys` [ ((0, 0x1008FF13), spawn "pamixer -i 5 --allow-boost -u; /home/zwilder/.scripts/volume_bar.sh"),
                     ((0, 0x1008FF11), spawn "pamixer -d 5; /home/zwilder/.scripts/volume_bar.sh")
                   ]

myLogHook :: Handle -> X ()
myLogHook h = dynamicLogWithPP $ def
    { ppCurrent         =   dzenColor "#111111" "#A6A6A6" . pad
    , ppSep             =   "  |  "
    , ppTitle           =   shorten 70
    , ppLayout          =   dzenColor "#A6A6A6" "#111111" .
                            (\x -> case x of
                                "Tall"            ->      "^i(/home/zwilder/.xmonad/data/icons/layout_tall.xbm)"
                                "Mirror Tall"     ->      "^i(/home/zwilder/.xmonad/data/icons/layout_mirror_tall.xbm)"
                                "Full"            ->      "^i(/home/zwilder/.xmonad/data/icons/layout_full.xbm)"
                                _                 ->      x
                            )
    ,ppOutput = hPutStrLn h
    }
