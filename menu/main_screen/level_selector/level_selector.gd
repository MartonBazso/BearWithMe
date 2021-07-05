extends Control


export(String) var button_path = null


func _ready():
	if not button_path:
		return
	var k = 1
	for j in range(globals.maxLevelOnFirstPage):
			var scene = load(button_path)
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
