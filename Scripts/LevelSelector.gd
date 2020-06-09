extends Control

func _ready():
	
	var k = 1
	for j in range(globals.maxLevelOnFirstPage): 
			var scene = load("res://menu/level_selector/LevelSelectorButton.tscn")
			var instance = scene.instance()
			instance.level = k
			$GridContainer.add_child(instance)
			k+=1
			


func _on_BackButton_pressed():
	var animationPlayer
	for c in get_node('../').get_children():
		if c is AnimationPlayer:
			animationPlayer = c
	animationPlayer.play('SlideLvlSelector')


func _on_MusicButton_toggled(button_pressed):
	globals.isVolumeOn = button_pressed
