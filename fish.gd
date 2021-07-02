extends Area2D
signal onFishCollected
func _ready():
	pass


func _on_Fish_body_entered(body):
	globals.money += 1
	emit_signal("onFishCollected")
	queue_free()
