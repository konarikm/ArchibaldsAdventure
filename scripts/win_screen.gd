extends Control

@export var music: AudioStream = preload("res://assets/Sounds/Fx 1.wav")

func _ready() -> void:
	var gui = get_node_or_null("/root/GameManager/GUI")
	if gui:
		gui.hide()
		
	$ScoreLabel.text = "Final score: " + str(GameManager.score)
	$CoinsLabel.text = "Coins collected: " + str(GameManager.coins)

	GameManager.play_music(music)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_main_menu_button_pressed() -> void:
	GameManager.score = 0
	GameManager.coins = 0
	
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
