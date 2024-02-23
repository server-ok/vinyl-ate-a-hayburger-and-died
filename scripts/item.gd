extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var world = get_parent()
onready var player = world.get_node("player")
onready var text = get_node("RichTextLabel")
onready var sprite = get_node("Sprite")
onready var particle = get_node("CPUParticles2D")
export var texture : Texture

var dialogues = ["but nothing happened", "did something happen", "yeah something probably happened", "uh i guess something is coming", "about right now"]
var dialogue_pacman = "ASTORIA Соус майонезный СМЕТАННЫЙ С ГРИБАМИ к мясу"

# Called when the node enters the scene tree for the first time.
func _ready():
	text.percent_visible = 0.0
	text.bbcode_text="[center][wave]"+dialogues[world.collected].to_upper()
	if texture != null: $Sprite.texture=texture
	
func set_texture(texture:Texture):
	sprite.texture=texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
var inter = false
var death = 2.0
var radius = 100
func _process(delta):
	player=get_node("../player")
	if !inter and world.collected!=world.tocollect:
		text.bbcode_text="[center][wave]"+dialogues[world.collected].to_upper() if player is KinematicBody2D else dialogue_pacman
	if !inter && player.global_position.distance_to(global_position) <= radius:
		inter = true
		$AudioStreamPlayer2D2.play()
	if inter:
		text.percent_visible += delta/2
		sprite.scale = lerp(sprite.scale, Vector2.ZERO, pow(delta, 0.8))
		particle.emitting=true
	else:
		return
	if text.percent_visible >= 1.0:
		death-=delta
	if death<=0:
		world.collected+=1
		queue_free()
