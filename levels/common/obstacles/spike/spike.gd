extends Node2D

func _ready():
	pass
	
func _on_Area2D_body_shape_entered(body_id, body, body_shape, local_shape):
	print("working as intended")
	print(body)
	if body.is_in_group("player"):
		body.defeat();
		pass
	
