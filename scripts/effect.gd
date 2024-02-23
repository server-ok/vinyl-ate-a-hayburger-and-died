extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var delay = 0.016
var bufsize=60*0.5
var buffer = []
func _ready():
	if visible:
		redraw()


# Called every frame. 'delta' is the elapsed time since the previous frame.
onready var vie=$"../Viewport".get_texture()
func redraw():
	var f = vie.get_data()
	var tex = ImageTexture.new()
	tex.create_from_image(f)
#	print(tex)
	if len(buffer)==bufsize: 
		buffer.invert()
		buffer.resize(bufsize-1)
		buffer.invert()
	buffer.push_back(tex)
	update()
	get_tree().create_timer(delay).connect("timeout", self, "redraw")

func _draw():
	for f in len(buffer):
#		f=len(buffer)-f-1
		var so = float(f)/len(buffer)
		draw_texture(buffer[f], Vector2(0,0), Color(so, so, so, so))
