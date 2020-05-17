extends Control


func _ready():
	globals.load_game()
	$VolumeButton._ready()
	if globals.isVolumeOn:
		MusicPlayer.volume_db = -40
	else:
		MusicPlayer.volume_db = -100

