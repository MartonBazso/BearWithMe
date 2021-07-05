extends TextureButton


func _on_MusicButton_toggled(button_pressed):
	MusicPlayer.stream_paused = button_pressed
