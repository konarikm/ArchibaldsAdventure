extends Node

var coins: int = 0:
	set(value):
		coins = value
		update_gui()

var score: int = 0:
	set(value):
		score = value
		update_gui()

@onready var music_player: AudioStreamPlayer = $MusicPlayer

func play_music(music_stream: AudioStream, start_position: float = 0.0) -> void:
	if music_player.stream == music_stream and music_player.playing:
		return
	
	music_player.stop()
	music_player.stream = music_stream
	music_player.play(start_position)

func stop_music() -> void:
	music_player.stop()
	
func playSoundFX(stream: AudioStream):
	var audio_player = AudioStreamPlayer.new()
	
	audio_player.stream = stream
	audio_player.volume_db = -25.0
	
	add_child(audio_player)
	
	audio_player.play()
	
	audio_player.finished.connect(audio_player.queue_free)
	
func update_gui():
	var coins_label = get_node_or_null("GUI/CoinsValue")
	var score_label = get_node_or_null("GUI/ScoreValue")
	
	if coins_label and score_label:
		coins_label.text = str(coins)
		score_label.text = str(score)
