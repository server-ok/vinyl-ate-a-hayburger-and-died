extends Node2D

var cango = [
	true, # U
	true, # D
	true, # R
	true  # L
]

var speed = 280
var move = Vector2(0,0)
var lastdir = ""
var bindings = {"left": Vector2(-1,0), "right": Vector2(1,0), "up": Vector2(0,-1), "down": Vector2(0,1)}

onready var raycasts = $raycasts.get_children() 

func _physics_process(delta: float) -> void:
	for r in raycasts:
		cango[int(r.name)] = !r.is_colliding()
	for b in bindings:
		if Input.is_action_pressed(b):
			lastdir = b
	match lastdir:
		"up":
			if cango[0]:
				move.y = -1
		"down":
			if cango[1]:
				move.y = 1
		"right":
			if cango[2]:
				move.x = 1
		"left":
			if cango[3]:
				move.x = -1
	if (move.x == 1 and !cango[2]) or (move.x == -1 and !cango[3]):
		move.x = 0
	if (move.y == 1 and !cango[1]) or (move.y == -1 and !cango[0]):
		move.y = 0
	if !cango[0] and !cango[1] and !cango[2] and !cango[3]:
		global_position=Vector2(297, 720)
	rotation = move.angle() if move != Vector2.ZERO else rotation
	$AnimationPlayer.playback_speed = lerp($AnimationPlayer.playback_speed, int(move != Vector2.ZERO), 0.065)
	$raycasts.rotation = -rotation
	global_position += move * speed * delta
