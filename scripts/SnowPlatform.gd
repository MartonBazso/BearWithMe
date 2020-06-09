extends Node2D

func _ready():
	pass

signal body_entered
func _on_Area2D_body_entered(body):
	emit_signal("body_entered") # Replace with function body.


func _on_Area2D_body_exited(body):
	pass#emit_signal("body_entered") # Replace with function body.


func _on_Area2D2_body_entered(body):
	$Timer.start() # Replace with function body.


func _on_Timer_timeout():
	for item in $StaticBody.get_children():
		item.disabled = !item.disabled


func _on_Area2D2_body_exited(body):
	$Timer.start() # Replace with function body.
