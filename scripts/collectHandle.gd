extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var collected = 0 setget collect, howmuchcollected
export var tocollect = 5

var octavia = preload("res://OCTAVIA.tscn")
func collect(much):
	collected=much
	if collected >= tocollect:
		if $player is KinematicBody2D:
			$player/walkHandler.set_process(false)
			$player/walkHandler.velocity=Vector2.ZERO
			$player/AnimatedSprite.stop()
			$player/AnimatedSprite.scale.x = -1
		else:
			$player.set_physics_process(false)
		for i in get_tree().get_nodes_in_group("monster"):
			i.queue_free()
		wallerp = 0.0
		var o = octavia.instance()
		o.global_position=$player.global_position
		add_child(o)
		o.connect("OCTAVIA_IS_DEAD", self, "end")
		
func end():
	if $player is KinematicBody2D:
		$Camera2D.lookatvinyl = false
		var t = get_tree().create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_SINE)
		t.tween_property($player/AnimatedSprite, "position", Vector2(0, -1000), 1)
		t.connect("finished", self, "trueend")
	else:
		trueend()
func trueend():
	yield(get_tree().create_timer(1.23), "timeout")
	get_tree().change_scene("res://end.tscn")

func howmuchcollected():
	return collected

onready var wallerp = 0.75
onready var cool = modulate
func _process(delta):
	$walls.modulate.a = lerp($walls.modulate.a, wallerp, 1-pow(delta, 0.75))
	
	if get_node_or_null("player")!=null and get_node_or_null("monster")!=null:
		modulate = lerp(cool, Color(1, 0, 0, cool.a), 1-min(1000, $player.global_position.distance_to($monster.global_position))/1000)
	else:
		modulate = lerp(modulate, cool, 0.25)
# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
