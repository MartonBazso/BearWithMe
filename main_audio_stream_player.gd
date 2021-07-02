extends AudioStreamPlayer

func _ready():
	_checkVolume(globals.isVolumeOn)


func _process(delta):
	_checkVolume(globals.isVolumeOn)


func _checkVolume(var shouldPlay):
	if(shouldPlay): 
		if(playing):
			stream_paused = false
		else: 
			playing = true
			stream_paused = false
	else:
		stream_paused = true
