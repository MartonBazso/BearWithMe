extends Control


func _ready():
	pass


func _input(event):
	DirectionManager.set_input_direction(event)
	match DirectionManager.get_orientation_as_string():
		"up":
			pass
		"down":
			pass
		"left":
			$AnimationPlayer.play("menu_transition")
		"right":
			pass #Back from settings
