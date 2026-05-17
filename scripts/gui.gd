extends CanvasLayer

func _ready() -> void:
	var ok_button = $ConfirmationDialog.get_ok_button()
	var cancel_button = $ConfirmationDialog.get_cancel_button()

	ok_button.focus_mode = Control.FOCUS_NONE
	cancel_button.focus_mode = Control.FOCUS_NONE
	
	$BackButton.focus_mode = Control.FOCUS_NONE
	
func _on_back_button_pressed() -> void:
	get_tree().paused = true
	$ConfirmationDialog.popup_centered()

func _on_confirmation_dialog_confirmed() -> void:
	get_tree().paused = false
	
	GameManager.score = 0
	GameManager.coins = 0
	
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_confirmation_dialog_canceled() -> void:
	get_tree().paused = false
