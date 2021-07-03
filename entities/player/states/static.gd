class_name Static
extends StateBase


func _handle_input(event):
	set_input_direction(event)
	var input_direction = get_input_direction()
	if input_direction:
		emit_signal("finished", "move")
