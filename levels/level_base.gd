class_name LevelBase
extends Node2D


export(int) var level_number = 0

func _ready():
	var viewport = get_tree().get_root()
	var size = 128
	#viewport.size = Vector2(size,size*1920/1080)
	print("stop")


