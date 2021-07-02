extends CanvasLayer


signal change_camera_zoom_to(value)

func _ready():
	$"../Finish".connect("body_entered", self, "_on_Finish_body_entered")


func _on_Control_gui_input(event):
	pass


func _on_HSlider_value_changed(value):
	emit_signal("change_camera_zoom_to", value)


func _on_Control_mouse_entered():
	globals.mouseInGUI = true # Replace with function body.


func _on_Control_mouse_exited():
	globals.mouseInGUI = false # Replace with function body.


func _on_Pause_pressed():
	_switch_to_pause(true)
	$PauseAndEndLevelScene.visible = true
	get_tree().paused = true


func _on_Finish_body_entered():
	if globals.maxLevelOnFirstPage == globals.currentLevel:
		globals.maxLevelOnFirstPage = globals.maxLevelOnFirstPage+1
	_switch_to_pause(false)
	$PauseAndEndLevelScene.visible = true
	get_tree().paused = true # Replace with function body.


func _on_PauseAndEndLevelScene_onResumePressed():
	$PauseAndEndLevelScene.visible = false
	get_tree().paused = false


func _on_PauseAndEndLevelScene_onRestartPressed():	
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_PauseAndEndLevelScene_onTitleScreenPressed():	
	get_tree().paused = false
	get_tree().change_scene("res://menu/main_screen/MainScreen.tscn") # Replace with function body.


func _on_PauseAndEndLevelScene_onNextGamePressed():	
	get_tree().paused = false
	globals.currentLevel = globals.currentLevel + 1
	get_tree().change_scene("res://levels/level"+str(globals.currentLevel)+".tscn") # Replace with function body.


func _switch_to_pause(var isPause):
	$PauseAndEndLevelScene/VSeparation/NextGame.visible = !isPause
	$PauseAndEndLevelScene/VSeparation/Resume.visible = isPause
