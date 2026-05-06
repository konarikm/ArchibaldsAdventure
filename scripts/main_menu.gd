extends Node2D

@export var music: AudioStream = preload("res://assets/Sounds/Light Ambience 1.wav")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var gui = get_node_or_null("/root/GameManager/GUI")
	if gui:
		gui.hide()
		
	GameManager.play_music(music, 3.4)

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")


func _on_controls_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/how_to_play.tscn")
