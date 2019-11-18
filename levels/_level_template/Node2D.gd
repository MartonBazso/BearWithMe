extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var Player = null
var cam = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



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
	globals.level = globals.level + 1
	get_tree().reload_current_scene()
	#get_tree().change_scene("res://levels\\level" + str(globals.level) + "\\level" + str(globals.level) + ".tscn")



func _on_CheckButton_toggled(button_pressed):
	print(button_pressed)
	$Player/PlayerView.current = button_pressed # Replace with function body.
	$Player/HugeView.current = !button_pressed