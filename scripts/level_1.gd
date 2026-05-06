extends Node2D

@export var level_music: AudioStream = preload("res://assets/Sounds/Light Ambience 2.wav")

func _ready() -> void:
	$"/root/GameManager/GUI".show()
	GameManager.play_music(level_music, 3.5)
