extends BaseButton
export(String) var level
signal level_button_pressed(level)

func _ready():
	$Label.text = str(level)
	if int(level) > globals.maxLevelReached:
		modulate = modulate.darkened(0.6)
		disabled = true


func _on_LevelSelectorButton_pressed():
	emit_signal("level_button_pressed", level)


func _on_LevelSelectorButton_button_up():
	$Label.rect_position.y -= 2


func _on_LevelSelectorButton_button_down():
	$Label.rect_position.y += 2
