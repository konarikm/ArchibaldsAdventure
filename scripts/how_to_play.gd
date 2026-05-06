extends Control


func _ready() -> void:
	var gui = get_node_or_null("/root/GameManager/GUI")
	if gui:
		gui.hide()

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
