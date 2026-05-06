extends CharacterBody2D

@onready var shoot_sound = preload("res://assets/Sounds/Retro Magic Protection 25.wav")
@onready var jump_sound = preload("res://assets/Sounds/Retro Jump StereoUP Simple 05.wav")


const SPEED = 700.0
const JUMP_VELOCITY = -2000.0

@export var magic_cooldown: float = 1 
# Boolean flag to check if the player is currently allowed to shoot
var can_cast_magic: bool = true

var is_spawning: bool = true

func _ready() -> void:
	await get_tree().create_timer(0.2).timeout
	is_spawning = false
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		GameManager.playSoundFX(jump_sound)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var run_multiplier = 1
	
	if Input.is_action_pressed("run"):
		run_multiplier = 2
	else:
		run_multiplier = 1
		
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED * run_multiplier
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	
	if velocity.x != 0:
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.play("idle")
		
	move_and_slide()

	if Input.is_action_just_pressed("magic") and can_cast_magic:
		can_cast_magic = false
		
		var magicNode = load("res://scenes/magic_area.tscn")
		var newMagic = magicNode.instantiate()
		
		if $AnimatedSprite2D.flip_h == false:
			newMagic.direction = -1
		else:
			newMagic.direction = 1
		
		newMagic.set_position($MagicSpawnPoint.global_transform.origin)
		get_parent().add_child(newMagic)
		GameManager.playSoundFX(shoot_sound)
		
		await get_tree().create_timer(magic_cooldown).timeout
		can_cast_magic = true
		
func killPlayer():
	position = %RespawnPoint.position
	$AnimatedSprite2D.flip_h = false

func _on_death_area_body_entered(body: Node2D) -> void:
	if is_spawning:
		return
		
	killPlayer()
	if GameManager.score >= 1000:
		GameManager.score -= 1000
	else:
		GameManager.score = 0
	
	
