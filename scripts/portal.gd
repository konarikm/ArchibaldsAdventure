extends Area2D

@export_file("*.tscn") var next_scene_path: String

@export var coins_required: int = 10

@export var portal_sound: AudioStream = preload("res://assets/Sounds/Retro Event UI 01.wav")
@onready var collision_shape = $CollisionShape2D
@onready var sprite = $Sprite2D

var is_active: bool = false

func _ready() -> void:
	GameManager.target_coins = coins_required
	
	sprite.modulate = Color.BLACK
	
	collision_shape.set_deferred("disabled", true)

func _process(delta: float) -> void:
	if not is_active and GameManager.coins >= coins_required:
		activate_portal()
		
func activate_portal() -> void:
	is_active = true
	
	sprite.modulate = Color.WHITE
	
	collision_shape.set_deferred("disabled", false)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and is_active:
		collision_shape.set_deferred("disabled", true)
		GameManager.play_music(portal_sound)
		
		await get_tree().create_timer(1.5).timeout
		
		if next_scene_path != "":
			get_tree().change_scene_to_file(next_scene_path)
		else:
			print("WARNING: Portal is missing the next scene path!")
