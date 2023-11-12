extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var hp = 2
func dmg(howmuch):
	hp-=howmuch
	$AudioStreamPlayer.play()
	$AudioStreamPlayer2.volume_db=[-10, -30, -1000][hp]
	if hp < 0:
		get_tree().quit(1)
