extends Node2D


func _ready() -> void:
	$"/root/GameManager/GUI".show()


func _process(delta: float) -> void:
	pass


func _on_level_end_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		GameManager.coins = 0
		GameManager.score = 0
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
