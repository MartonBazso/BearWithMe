extends StateBase

var speed = globals.speed


func _enter():	
	var orientation = get_orientation_as_string()
	if orientation:
		owner.get_node("AnimationPlayer").play("move_" + orientation)


func _handle_input(event):
	pass


func _update(delta):
	var velocity = get_input_direction() * speed
	var collide = owner.move_and_collide(velocity)
	if(collide != null):
		emit_signal("finished", "stop")


func _on_animation_finished(anim_name):
	owner.get_node("AnimationPlayer").play("move")
