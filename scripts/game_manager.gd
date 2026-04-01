extends Node

var coins = 0
var score = 0

func playSoundFX(stream: AudioStream):
	var audio_player = AudioStreamPlayer.new()
	
	audio_player.stream = stream
	audio_player.volume_db = -30.0
	
	add_child(audio_player)
	
	audio_player.play()
	
	audio_player.finished.connect(audio_player.queue_free)
	
func _process(delta: float) -> void:
	$"GUI/CoinsValue".text = str(coins)
	$"GUI/ScoreValue".text = str(score)
