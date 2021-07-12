extends Node


var orientations = {
	"up": Vector2(0,-1),
	"down": Vector2(0,1),
	"left": Vector2(-1,0),
	"right": Vector2(1,0),
}

var current_direction = null

func get_input_direction():
	return current_direction


func set_input_direction(event):
	if not event:
		current_direction = null
		return

	var direction_vector = Vector2()

	if (event is InputEventMultiScreenDrag or
	event is InputEventSingleScreenDrag or
	event is InputEventJoypadMotion):
	#(event is InputEventMouseMotion and Input.is_mouse_button_pressed(BUTTON_LEFT))):
		direction_vector = event.relative
	elif event is InputEventKey:
		direction_vector = _get_input_direction_by_key()

	current_direction = _get_direction_from_vector(direction_vector.normalized())


func _get_input_direction_by_key():
	var input_direction = Vector2()
	input_direction.x = int(Input.is_action_pressed("PLAYER_RIGHT")) - int(Input.is_action_pressed("PLAYER_LEFT"))
	input_direction.y = int(Input.is_action_pressed("PLAYER_DOWN")) - int(Input.is_action_pressed("PLAYER_UP"))
	return input_direction


func _get_direction_from_vector(vector):
	var dir = Vector2()

	if abs(vector.x) >= abs(vector.y):
		dir.y = 0
		dir.x = floor(vector.x + 0.5)
	else:
		dir.x = 0
		dir.y = floor(vector.y + 0.5)

	return dir


func get_orientation_as_string():
	for key in orientations:
		var value = orientations[key]
		if value == current_direction:
			return key
