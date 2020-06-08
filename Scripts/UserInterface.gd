extends CanvasLayer


signal change_camera_zoom_to(value)

func _ready():
	pass


func _on_Control_gui_input(event):
	pass


func _on_HSlider_value_changed(value):
	emit_signal("change_camera_zoom_to", value)


func _on_Control_mouse_entered():
	globals.mouseInGUI = true # Replace with function body.


func _on_Control_mouse_exited():
	globals.mouseInGUI = false # Replace with function body.


func _on_Pause_pressed():
	pass#get_tree().paused = true # Replace with function body.
