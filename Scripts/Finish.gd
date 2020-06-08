extends Node2D

func _ready():
	pass

func _on_Area2D_body_entered(body):
	print(globals.currentLevel)
	#globals.currentLevel = globals.currentLevel+1
	#get_tree().change_scene('res://levels/level'+str(globals.currentLevel)+'.tscn')
