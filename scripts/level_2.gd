extends Node2D

@export var level_music: AudioStream = preload("res://assets/Sounds/Light Ambience 3.wav")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"/root/GameManager/GUI".show()

	GameManager.update_gui()
	
	GameManager.play_music(level_music, 2.2)
