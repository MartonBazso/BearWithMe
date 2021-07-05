extends Control
export(String) var level


func _ready():
	$LevelSelector/Label.text = str(level)
	if int(level) > globals.maxLevelReached:
		$LevelSelector.modulate = $LevelSelector.modulate.darkened(0.6)
		$LevelSelector.disabled = true


func _on_LevelSelector_pressed():
	get_tree().change_scene("levels/level_" + level + "/level_" + level + ".tscn")


func _on_LevelSelector_button_up():
	$LevelSelector/Label.rect_position.y -= 2


func _on_LevelSelector_button_down():
	$LevelSelector/Label.rect_position.y += 2
