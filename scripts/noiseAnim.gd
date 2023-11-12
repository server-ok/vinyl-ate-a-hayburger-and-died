extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
var et = 0.0
export var thisone = false
func _physics_process(delta):
	texture.noise.seed += 1
	et += delta
	if et>=3 and thisone:
		modulate.a -= delta
