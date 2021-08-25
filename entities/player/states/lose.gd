extends StateBase

var speed = globals.speed


func _enter():
	#owner.get_node("AnimationPlayer").play("defeat")
	pass


func _handle_input(event):
	#we just entered rigor mortis so we can't ever do anything anymore
	pass


func _on_animation_finished(anim_name):
	#defeat screen should open here
	pass
