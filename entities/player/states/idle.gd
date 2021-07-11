extends Static


func _enter():
	var orientation = DirectionManager.get_orientation_as_string()
	if orientation:
		owner.get_node("AnimationPlayer").play("idle_" + orientation)
