extends Control
var spacingH = 120
var spacingV = 175

func _ready():
	var margin = 60
	
	var k = 1
	for j in range(6): # sor
		for i in range(5): #oszlop
			var scene = load("res://menu/level_selector/LevelSelectorButton.tscn")
			var instance = scene.instance()
			instance.rect_position.x = margin + i * spacingH
			instance.rect_position.y = margin + j * spacingV
			instance.level = k
			add_child(instance)
			k+=1
			
	var scene = load("res://menu/level_selector/BackButton.tscn")
	var instance = scene.instance()
	instance.rect_position.x = 50
	instance.rect_position.y = 1150
	add_child(instance)
