extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
var play = preload("res://player.tscn")
var pac = preload("res://pacman_player.tscn")
var player = 0
#func _input(event: InputEvent) -> void:
#	if event is InputEventKey:
#		if Input.is_action_pressed("pacman1"):
#			var p = get_parent().get_node("player")
#			player=wrapi(player+1, 0, 2)
#			if player == 0:
#				var pp = play.instance()
#				pp.global_position = p.global_position
#				pp.name = p.name
#				get_parent().remove_child(p)
#				get_parent().add_child(pp)
#			if player == 1:
#				var pp = pac.instance()
#				pp.global_position = p.global_position
#				pp.name = p.name
#				get_parent().remove_child(p)
#				get_parent().add_child(pp)

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pacman2") and Input.is_action_pressed("pacman1"):
			var p = get_parent().get_node("player")
			player=wrapi(player+1, 0, 2)
			if player == 0:
				Engine.time_scale = 1
				var pp = play.instance()
				pp.global_position = p.global_position
				pp.name = p.name
				get_parent().remove_child(p)
				get_parent().add_child(pp)
			if player == 1:
				var pp = pac.instance()
				for i in get_tree().get_nodes_in_group("items"):
					i.set_texture(preload("res://sprites/pacman pony mode/astoria.png"))
				Engine.time_scale = 1.5
				pp.global_position = p.global_position
				pp.name = p.name
				get_parent().remove_child(p)
				get_parent().add_child(pp)
