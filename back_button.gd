extends Control

var posX = 30 # +10 pixel (2 digits 16-16)
var posY = 16
func _ready():
	$BackButton/Label.text = '<'
	$BackButton/Label.rect_position.x = posX
	$BackButton/Label.rect_position.y = posY


func _on_BackButton_pressed():
	#var preloaded_scene = load('res://levels/_titlescreen/TitleScreen2.tscn')
	#var value = get_tree().change_scene_to(preloaded_scene)
	var animationPlayer
	for c in get_node('../../').get_children():
		if c is AnimationPlayer:
			animationPlayer = c
	animationPlayer.play('SlideLvlSelector')
	

func _on_BackButton_button_up():
	$BackButton/Label.rect_position.x -= 10
	$BackButton/Label.rect_position.y -= 10 


func _on_BackButton_button_down():
	$BackButton/Label.rect_position.x += 10
	$BackButton/Label.rect_position.y += 10 
