extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

onready var player = $"../player"
var lookatvinyl = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
var et = .0
func _process(delta):
	player=get_node("../player")
	if lookatvinyl:
		global_position = player.global_position+(player.get_node("walkHandler").velocity if player is KinematicBody2D else player.move*2)*150
	et+=delta
	rotation_degrees = sin(et)*10
	if Input.is_action_pressed("DEBUG"):
		global_position=player.get_parent().get_node("monster").global_position
