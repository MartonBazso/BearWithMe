extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var Player = null
var cam = null
var isVolumePressed = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$UserInterface/VolumeButton.set_pressed(!globals.isVolumeOn)



func _on_Node2D_ready():
	pass
	#Player = load("res://Player.tscn").instance()
	#Player.position = Vector2(300,720/2)
	#cam = Camera2D.new()
	#cam.position.x = 100
	#cam.make_current()
	#$Player.add_child(cam)
	#add_child(Player)



func _on_Target_body_entered(body):
	globals.currentLevel = globals.currentLevel + 1
	get_tree().reload_current_scene()
	#get_tree().change_scene("res://levels\\level" + str(globals.level) + "\\level" + str(globals.level) + ".tscn")


func _on_UserInterface_onZoomToggled(button_pressed):
	$Player/PlayerView.current = !button_pressed
	$Player/HugeView.current = button_pressed
	
	

func _on_UserInterface_onPausePressed():
	$UserInterface/PauseAndEndLevelScene.visible = true
	get_tree().paused = true


func _on_PauseAndEndLevelScene_onTitleScreenPressed():
	get_tree().paused = false
	get_tree().change_scene("res://levels/main_screen/MainScreen.tscn")


func _on_PauseAndEndLevelScene_onResumePressed():
	$UserInterface/PauseAndEndLevelScene.visible = false
	get_tree().paused = false


func _on_PauseAndEndLevelScene_onRestartPressed():
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_PauseAndEndLevelScene_onNextGamePressed():
	print("Next game would beeee... : " + str(globals.currentLevel + 1))
