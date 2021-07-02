extends Static


func _enter():
	var orientation = get_orientation_as_string()
	if orientation:
		owner.get_node("AnimationPlayer").play("stop_" + orientation)


func _on_animation_finished(anim_name):
	emit_signal("finished", "idle")
