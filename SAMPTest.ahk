#NoEnv
#SingleInstance force
#include %A_ScriptDir%\SAMP.ahk
initZonesAndCities()
return

; R5
; Test für die SAMP UDF für AutoHotKey
; Zum Testen <NUM5> im Spiel drücken.
Numpad5::
	; Chatstatus vorbereiten
	msg := "{FFAA00}bist{FFFF00} momentan {FFAA00}nicht{FFFF00}"
	if(isInChat())
		msg := "{FFAA00}bist{FFFF00} momentan {FFFF00}"
	
	; Koordinaten auslesen
	coords := getCoordinates()
	
	; Position aus den Koordinaten errechnen
	position := calculateZone(coords[1], coords[2], coords[3]) . " - " . calculateCity(coords[1], coords[2], coords[3])
	
	; Text in den Chat schreiben ({FFFF00} = gelb, {FFAA00} = orange)
	; Hallo <Username>.
	addChatMessage("{FFFF00}Hallo {FFAA00}" . getUsername() . "{FFFF00}.")
	; Du bist momentan (nicht) in einem Dialog oder im Chat.
	addChatMessage("{FFFF00}Du " . msg . " in einem Dialog oder im Chat.")
	; Dein Fahrzeug hat <HP> HP und du befindest dich bei genau
	addChatMessage("{FFFF00}Dein Fahrzeug hat {FFAA00}" . GetVehicleHealth() . " HP{FFFF00} und befindest dich bei genau")
	; (<X>|<Y>|<Z>), das liegt in <Position>.
	addChatMessage("{FFAA00}(" . coords[1] . " | " . coords[2] . " | " . coords[3] . "){FFFF00}, das liegt in {FFAA00}" . position . "{FFFF00}.") ;
	
	; Abstand im Chat erzeugen
	addChatMessage(" ")
	
	; Weiterhin kannst du ganz privat im lokalen Chatfenster schreiben,
	SendChat("{FFFF00}Weiterhin kannst du ganz privat im lokalen Chatfenster schreiben,")
	
	; Nachricht senden
	SendChat("mit anderen Chatten")
	
	; Befehl senden
	SendChat("/b und Befehle ausführen.")
	
	; HP und Rüstung anzeigen
	showGameText("~r~Health: ~g~" . GetPlayerHealth() . "~w~~n~~r~Armor: ~g~" . GetPlayerArmor() . "~w~", 10000, 4)
	return
