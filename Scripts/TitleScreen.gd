extends Control



func _on_PlayButton_pressed():
	var animationPlayer
	for c in get_node('../').get_children():
		if c is AnimationPlayer:
			animationPlayer = c
	animationPlayer.play('SlideTitle')


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_SettingsButton_pressed():
	globals.delete_save()
	
