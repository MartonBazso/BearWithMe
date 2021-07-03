extends Area2D

func _ready():
	pass


func _on_Target_body_entered(body):
	$AnimatedSprite.play("happy")
