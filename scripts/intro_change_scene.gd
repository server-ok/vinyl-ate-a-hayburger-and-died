extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var game = preload("res://test.tscn")
func doit():
	get_tree().change_scene_to(game)
