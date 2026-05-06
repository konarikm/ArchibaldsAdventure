extends Node2D

@export var level_music: AudioStream = preload("res://assets/Sounds/Light Ambience 2.wav")
@export var portal_sound: AudioStream = preload("res://assets/Sounds/Retro Event UI 01.wav")

func _ready() -> void:
	$"/root/GameManager/GUI".show()
	GameManager.play_music(level_music, 3.5)

func _on_level_end_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		$LevelEnd/CollisionShape2D.set_deferred("disabled", true)
		GameManager.play_music(portal_sound)
		await get_tree().create_timer(1.0).timeout
		
		get_tree().change_scene_to_file("res://scenes/level_2.tscn")
