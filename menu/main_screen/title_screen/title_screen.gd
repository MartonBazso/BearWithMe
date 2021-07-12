extends Control


func _on_PlayButton_pressed():
	owner.get_node("AnimationPlayer").play("menu_transition")


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_SettingsButton_pressed():
	globals.delete_save()

