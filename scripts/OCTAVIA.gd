extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var WHAT_OCTAVIA_SAYS = ["HEY VINYL ARE YOU OK", "ITS HALLOWEEN NIGHT", "WAKE UP", "LETS GO GET SOME CANDIES", "I MADE A BUCKET FROM YOUR DJ SET"]
var OCTAVIA_LINE_INDEX = 0 setget indset, indget
var TIME_OCTAVIA_WASTED = 0.0
onready var OCTAVIA_CHATBOX = $RichTextLabel
var time_to_Die = 2.0
signal OCTAVIA_IS_DEAD
func _ready():
	OCTAVIA_CHATBOX.percent_visible = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(HOW_LONG_OCTAVIA_WAS_PREPARING_A_FRAME):
	TIME_OCTAVIA_WASTED+=HOW_LONG_OCTAVIA_WAS_PREPARING_A_FRAME
	modulate.a = lerp(0, 1, min(2, TIME_OCTAVIA_WASTED)/2)
	if TIME_OCTAVIA_WASTED>=2:
		indset(int(floor((TIME_OCTAVIA_WASTED-2)/4)))
		if OCTAVIA_CHATBOX.bbcode_text!="[tornado]"+WHAT_OCTAVIA_SAYS[OCTAVIA_LINE_INDEX]:
			OCTAVIA_CHATBOX.bbcode_text="[tornado]"+WHAT_OCTAVIA_SAYS[OCTAVIA_LINE_INDEX]
		OCTAVIA_CHATBOX.percent_visible+=HOW_LONG_OCTAVIA_WAS_PREPARING_A_FRAME/2
		if OCTAVIA_CHATBOX.bbcode_text=="[tornado]"+WHAT_OCTAVIA_SAYS[len(WHAT_OCTAVIA_SAYS)-1] and OCTAVIA_CHATBOX.percent_visible >= 1.0:
			time_to_Die-=HOW_LONG_OCTAVIA_WAS_PREPARING_A_FRAME
			TIME_OCTAVIA_WASTED-=HOW_LONG_OCTAVIA_WAS_PREPARING_A_FRAME
			if time_to_Die<=0:
				queue_free()
				emit_signal("OCTAVIA_IS_DEAD")
		
func indset(v):
#	print(OCTAVIA_LINE_INDEX, " ",v)
	if OCTAVIA_LINE_INDEX!=v:
		OCTAVIA_CHATBOX.percent_visible=0.0
	OCTAVIA_LINE_INDEX=min(v, len(WHAT_OCTAVIA_SAYS))
func indget():
	return OCTAVIA_LINE_INDEX
