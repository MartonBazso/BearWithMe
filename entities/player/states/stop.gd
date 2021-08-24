extends Static


func _enter():
	owner.get_node("Camera2D/ScreenShake").start(0.1, 8, 4)
	var orientation = DirectionManager.get_orientation_as_string()
	if orientation:
		owner.get_node("AnimationPlayer").play("stop_" + orientation)


func _on_animation_finished(_anim_name):
	emit_signal("finished", "idle")
