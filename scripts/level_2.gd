extends Node2D


func _ready() -> void:
	$"/root/GameManager/GUI".show()


func _process(delta: float) -> void:
	pass


func _on_level_end_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://scenes/level_3.tscn")
