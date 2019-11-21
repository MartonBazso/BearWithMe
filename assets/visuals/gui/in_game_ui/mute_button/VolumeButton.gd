extends Control



func _ready():
	$".".set_pressed(!globals.isVolumeOn)


func _on_VolumeButton_toggled(button_pressed):
	if !globals.isVolumeOn:
		MusicPlayer.volume_db = -40
	else:
		MusicPlayer.volume_db = -100
	globals.isVolumeOn = !button_pressed
