SendMode Input
SetWorkingDir %A_ScriptDir%
#Warn
#UseHook
#NoEnv
#SingleInstance force
#include %A_ScriptDir%\SAMP.ahk

Hotkey, Enter, Off
Hotkey, Escape, Off
return

+T::
~t::
Suspend On
Hotkey, Enter, On
Hotkey, Escape, On
Hotkey, t, Off
return

~NumpadEnter::
~Enter::
Suspend Permit
Suspend Off
Hotkey, t, On
Hotkey, Enter, Off
Hotkey, Escape, Off
return

~Escape::
Suspend Permit
Suspend Off
Hotkey, t, On
Hotkey, Enter, Off
Hotkey, Escape, Off
return


;#########################################################################################################


;Gebt einen Spielernamen ein, um weitere Infos über diesen Spieler zu bekommen
Numpad1::
SendInput tName:{Space}
Suspend On
Hotkey, Enter, On
Hotkey, Escape, On
Input varName, V I M,{enter}
SendInput {end}+{home}{Del}{esc}
;updateScoreboardData() ;wird nun implizit aufgerufen
varID := getPlayerIdByName(varName)
showGameText(getPlayerNameById(varID) "~n~Score: " getPlayerScoreById(varID) "~n~Ping: " getPlayerPingById(varID), 2000, 5)
return

;Gebt eine ID ein, um weitere Infos über diesen Spieler zu bekommen
Numpad2::
SendInput tID:{Space}
Suspend On
Hotkey, Enter, On
Hotkey, Escape, On
Input varID, V I M,{enter}
SendInput {end}+{home}{Del}{esc}
;updateScoreboardData() ;wird nun implizit aufgerufen
showGameText(getPlayerNameById(varID) "~n~Score: " getPlayerScoreById(varID) "~n~Ping: " getPlayerPingById(varID) "~n~IsNPC: " isNPCById(varID), 2000, 5)
return

;Spielt einen "Audio Stream" ab
Numpad3::
playAudioStream("http://breakz.us/radio/listen.pls")
return

;Stoppt einen "Audio Stream"
Numpad4::
stopAudioStream()
return

;Zeigt diverse Infos über die eigene Spielerfigur an
Numpad5::
if ( isInChat() )
return
addChatMessage("{FFFFFF}Name: {FF0000}" getUsername())
addChatMessage("{FFFFFF}HP: {FF0000}" getPlayerHealth() "{FFFFFF}, ARMOR: {FF0000}" getPlayerArmor())
pos := getCoordinates()
addChatMessage("{FFFFFF}Zone: {FF0000}" calculateZone(pos[1],pos[2],pos[3]) "{FFFFFF}, Stadt: {FF0000}" calculateCity(pos[1],pos[2],pos[3]))
SendChat("blub")
SendChat("/asd")
showGameText("test", 2000, 5)
return

;Zeigt eine Dialog-Box an
Numpad6::
showDialog(0, "Titel", "some text...", "OK" )
return

;show some info about the current vehicle
Numpad7::
addChatMessage("{FFFFFF}Vehicle Type:" getVehicleType())
addChatMessage("{FFFFFF}Model:" getVehicleModelId())
addChatMessage("{FFFFFF}Model Name:" getVehicleModelName())
addChatMessage("{FFFFFF}Is Driver:" isPlayerDriver())
addChatMessage("{FFFFFF}Light State:" getVehicleLightState())
addChatMessage("{FFFFFF}Engine State:" getVehicleEngineState())
addChatMessage("{FFFFFF}Door State:" getVehicleLockState())
return

Numpad9::
addMessageToChatWindow("{FFFFFF}block chat " (blchat ? "{FF0000}off" : "{00FF00}on"))
if(blchat)
	unBlockChatInput()
else
	blockChatInput()
blchat:=!blchat
return
