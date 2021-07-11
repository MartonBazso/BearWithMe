class_name Static
extends StateBase


func _handle_input(event):
	DirectionManager.set_input_direction(event)
	var input_direction = DirectionManager.get_input_direction()
	if input_direction:
		emit_signal("finished", "move")
