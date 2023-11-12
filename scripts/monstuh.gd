extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var world = get_parent()
onready var player = world.get_node("player")
onready var sound = $AudioStreamPlayer2D
onready var nav = $NavigationAgent2D
var speed = 180
# Called when the node enters the scene tree for the first time.
func _ready():
#	sound.play()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
var sleep = 0.0
var smart = 1
func _physics_process(delta):
	$Sprite.texture.noise.seed+=1
	nav.set_target_location(player.global_position)
	nav.set_velocity((global_position.direction_to(nav.get_next_location()))*speed)
	if global_position.distance_to(player.global_position)<=nav.target_desired_distance:
		player.get_node("hpHandler").dmg(1)
#		queue_free()
		speed = speed*1.2
		scale = scale*1.3
		smart*=2
		global_position=Vector2(0,0)
		sleep = 3
	if sleep > 0:
		sleep-=delta
		return
#	print(nav.get_next_location())
#	move_and_slide((global_position.direction_to(nav.get_next_location()))*speed)
#	print(nav.get_next_location().distance_to(global_position))
	if nav.get_next_location().distance_to(global_position)<=nav.path_desired_distance*2:
		sleep = rand_range(0.25, 0.5)/smart
	global_position+=(global_position.direction_to(nav.get_next_location()))*speed*delta
