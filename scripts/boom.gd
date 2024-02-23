extends AnimatedSprite

func _ready() -> void:
	play("default")
	$AudioStreamPlayer2D.play()
	$AudioStreamPlayer2D.connect("finished", self, "queue_free")
