extends AnimatedSprite2D

@onready var coin_pickup = preload("res://assets/Sounds/Retro PickUp Coin 04.wav")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		GameManager.playSoundFX(coin_pickup)
		GameManager.coins += 1
		GameManager.score += 50
		queue_free() 
