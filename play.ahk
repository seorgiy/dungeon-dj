#NoEnv
#SingleInstance force
Menu, tray, Tip, Dungeon DJ
SendMode Input

version := "1.0"

; Reading config
IniRead, foobar, %A_WorkingDir%\config.ini, main, player_exe_path
IniRead, language, %A_WorkingDir%\config.ini, main, language
IniRead, notifications, %A_WorkingDir%\config.ini, main, notifications
IniRead, main_hotkey, %A_WorkingDir%\config.ini, main, main_hotkey

; GUI
Gui -Caption +AlwaysOnTop
Gui, Add, Picture, x80 w380 h-1 BackgroundTrans, %A_ScriptDir%\Data\cat.png
Gui, font, s20 cBlack q5 wbold, Rubik
Gui, Add, Text, x20 y10  BackgroundTrans, Dungeon DJ
Gui, font, s8.2 c666666 q5, Rubik
Gui, Add, Text, x20 y40 BackgroundTrans, ver: %version%
Gui, font, s9.7 c666666 q5, Rubik
Gui, Add, Text, x390 y296 BackgroundTrans, @seorgiy
Gui, Show, w480 h320
Sleep 2000
Gui, Hide
GuiClose:
GuiEscape:
Gui, Hide

; Get all music as folders names
music_folder := A_WorkingDir "\music"
all_folders := []
Loop, Files, % music_folder "\*", D
all_folders.Push(A_LoopFileName)

; Foobar2000 separate commands
Hotkey, %main_hotkey% & 1, PlayPauseMusic, pressed, On
Hotkey, %main_hotkey% & 2, NextTrack, pressed, On
Hotkey, %main_hotkey% & 3, ShowHidePlayer, pressed, On

; Set all hotkeys as main_hotkey + Key
Keys := [ "q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "a", "s", "d", "f", "g", "h", "j", "k", "l", "z", "x", "c", "v", "b", "n", "m" ]
for index, element in Keys {
    Hotkey, %main_hotkey% & %element%, RunPlaylist, pressed, On
  }
Return

PlayPauseMusic:
  Run, %foobar% /playpause
Return

ShowHidePlayer:
  IfWinActive, ahk_exe foobar2000.exe
  {
    Run, %foobar% /hide
  }
  IfWinNotActive, ahk_exe foobar2000.exe
  {
    Run, %foobar% /show
  }
Return

NextTrack:
  Run, %foobar% /next
Return

RunPlaylist:
  StringSplit, key_array, A_ThisHotkey, &
  playlist := getFolderByKey(all_folders, Trim(key_array2))
  playlist_name := SubStr(playlist, 2)
  Run, %foobar% "%A_WorkingDir%\music\%playlist%"
  if (notifications = "on")
    text := language = "ru" ? "Теперь играет: " : "Now playing: "
    PleasantNotify(text, playlist_name, 300, 90, "b r", "3") 
Return

getFolderByKey(all_folders, key){
  for i, val in all_folders {
    if (SubStr(val, 1, 1) = key)
      return val
  }
}

PleasantNotify(title, message, pnW=700, pnH=300, position="b r", time=10) {
  global pn_title, pn_msg, PN_hwnd, w, h
  Notify_Destroy()
  Gui, Notify: +AlwaysOnTop +ToolWindow -SysMenu -Caption +LastFound
  PN_hwnd := WinExist()
  WinSet, ExStyle, +0x20
  WinSet, Transparent, 0
  Gui, Notify: Color, 0xF2F2F0
  Gui, Notify: Font, cce0000 s17 wBold, Rubik
  Gui, Notify: Add, Text, % " x" 20 " y" 10 " w" pnW-20 " vpn_title", % title
  Gui, Notify: Font, c666666 s15 wRegular
  Gui, Notify: Add, Text, % " x" 17 " y" 45 " w" pnW-20 " h" pnH-56 " vpn_msg", % message
  RealW := pnW + 50
  RealH := pnH + 20
  Gui, Notify: Show, W%RealW% H%RealH% NoActivate
  WinMove(PN_hwnd, position)
  if A_ScreenDPI = 96
    WinSet, Region,0-0 w%pnW% h%pnH% R40-40,%A_ScriptName%
  /* For Screen text size 125%
  if A_ScreenDPI = 120
    WinSet, Region, 0-0 w800 h230 R40-40, %A_ScriptName%
  */
  winfade("ahk_id " PN_hwnd,210,5)
  if (time <> "P")
  {
    Closetick := time*1000
    SetTimer, ByeNotify, % Closetick
  }
}

Notify_Destroy() {
  global PN_hwnd
  ByeNotify:
  SetTimer, ByeNotify, Off
    winfade("ahk_id " PN_hwnd,0,5)
    Gui, Notify: Destroy
  return
}

pn_mod_title(title) {
  global pn_title
  GuiControl, Notify: Text, pn_title, % title
}

pn_mod_msg(message) {
  global pn_msg
  GuiControl, Notify: Text, pn_msg, % message
}

WinMove(hwnd,position) {
   SysGet, Mon, MonitorWorkArea
   WinGetPos,ix,iy,w,h, ahk_id %hwnd%
   x := InStr(position,"l") ? MonLeft : InStr(position,"hc") ?  (MonRight-w)/2 : InStr(position,"r") ? MonRight - w : ix
   y := InStr(position,"t") ? MonTop : InStr(position,"vc") ?  (MonBottom-h)/2 : InStr(position,"b") ? MonBottom - h : iy
   WinMove, ahk_id %hwnd%,,x,y
}

winfade(w:="",t:=128,i:=1,d:=10) {
    w:=(w="")?("ahk_id " WinActive("A")):w
    t:=(t>255)?255:(t<0)?0:t
    WinGet,s,Transparent,%w%
    s:=(s="")?255:s ;prevent trans unset bug
    WinSet,Transparent,%s%,%w%
    i:=(s<t)?abs(i):-1*abs(i)
    while(k:=(i<0)?(s>t):(s<t)&&WinExist(w)) {
        WinGet,s,Transparent,%w%
        s+=i
        WinSet,Transparent,%s%,%w%
        sleep %d%
    }
}