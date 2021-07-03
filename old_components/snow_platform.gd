extends Node2D

func _ready():
	pass

func _on_Area2D2_body_entered(body):
	globals.screen_shake = false
	$Timer.start()# Replace with function body.


func _on_Timer_timeout():
	for child in get_children():
		if child is StaticBody2D:
			for item in child.get_children():
				item.disabled = !item.disabled


func _on_Area2D2_body_exited(body):	
	globals.screen_shake = true
	$Timer.start() # Replace with function body.
