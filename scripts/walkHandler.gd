extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var me = get_parent()
onready var anim = me.get_node("AnimatedSprite")
var speed = 280
var runspeed = 280*1.5
var velocity = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
onready var sc = anim.scale
func _process(delta):
	velocity = Vector2(
		Input.get_action_strength('right')-Input.get_action_strength('left'),
		Input.get_action_strength('down')-Input.get_action_strength('up')
	)
	sc.x = -int(ceil(velocity.x)) if int(ceil(velocity.x)) != 0 else int(ceil(sc.x))
	anim.scale.x = lerp(anim.scale.x, sc.x, 1-pow(delta, 0.1))
	if velocity.normalized()!=Vector2.ZERO:
		anim.play("walk")
	else:
		anim.play("idle")
	me.move_and_slide(velocity*lerp(speed,runspeed,Input.get_action_strength("run")))
