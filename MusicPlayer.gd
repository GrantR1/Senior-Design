extends AudioStreamPlayer2D

func _ready():
	# Autoplay can be done here or via the Inspector
	if not playing:
		play()
