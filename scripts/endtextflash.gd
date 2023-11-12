extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.
var t = ["everyone", "everypony"]
var i = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
var toc = 0.2
func _physics_process(delta):
	toc-=delta
	if toc>0:
		return
	toc=0.2
	i = wrapi(i+1, 0, 2)
#	print(i)
	text = "game end\n\nhappy halloween "+t[i]
