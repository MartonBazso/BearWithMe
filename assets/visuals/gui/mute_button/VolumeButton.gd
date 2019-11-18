extends Control



func _ready():
	$".".set_pressed(!globals.isVolumeOn)


func _on_VolumeButton_toggled(button_pressed):
	MusicPlayer.stream_paused = globals.isVolumeOn
	globals.isVolumeOn = !button_pressed
