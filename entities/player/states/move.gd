extends StateBase

var speed = globals.speed


func _enter():
	var orientation = DirectionManager.get_orientation_as_string()
	if orientation:
		owner.get_node("AnimationPlayer").play("move_" + orientation)


func _update(delta):
	var velocity = DirectionManager.get_input_direction() * speed #* delta
	print(velocity)
	var collide = owner.move_and_collide(velocity)
	if(collide != null):
		emit_signal("finished", "stop")
