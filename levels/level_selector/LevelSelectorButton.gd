extends Control
export(int) var level
var posX = 30 # +10 pixel (2 digits 16-16)
var posY = 16
func _ready():
	$LevelSelector/Label.text = str(level)
	if level > 9:
		posX = 16
	$LevelSelector/Label.rect_position.x = posX
	$LevelSelector/Label.rect_position.y = posY
	if level > globals.maxLevelReached:
		$LevelSelector.modulate = $LevelSelector.modulate.darkened(0.6)
		$LevelSelector.disabled = true


func _on_LevelSelector_pressed():
	globals.currentLevel = level
	get_tree().change_scene('res://levels/level_template/Node2D.tscn')#'res://levels/level'+ str(level) +'/Level'+ str(level) +'.tscn')


func _on_LevelSelector_button_up():
	$LevelSelector/Label.rect_position.x -= 10
	$LevelSelector/Label.rect_position.y -= 10 


func _on_LevelSelector_button_down():	 
	$LevelSelector/Label.rect_position.x += 10
	$LevelSelector/Label.rect_position.y += 10 
