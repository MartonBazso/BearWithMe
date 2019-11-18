extends Control

func _ready():
	pass


func _on_VolumeButton_toggled(button_pressed):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), 0)
