extends Node

onready var tween = get_node("Tween")
var current_pos = Vector2(1080/2, 1920/2)


func _input(event):
	DirectionManager.set_input_direction(event)
	match DirectionManager.get_orientation_as_string():
		"up":
			pass
		"down":
			pass
		"left":
			print("left")
			_move_camera_to(Vector2(1080/2 - 1080, 1920/2))
		"right":
			print("right")
			_move_camera_to(Vector2(1080/2 + 1080, 1920/2))


func _move_camera_to(new_pos):
	print(current_pos)
	print(new_pos)
	tween.interpolate_property($Camera2D, "position",
	current_pos, new_pos, 1,
	Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
