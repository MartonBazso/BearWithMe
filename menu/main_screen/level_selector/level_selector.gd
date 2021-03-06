extends Control


export(String) var button_path = null

func _ready():
	if not button_path:
		return
	var k = 1
	for _j in range(globals.maxLevelOnFirstPage):
			var scene = load(button_path)
			var instance = scene.instance()
			instance.level = str(k)
			var _success = instance.connect("level_button_pressed", self, "_on_level_selected")
			$GridContainer.add_child(instance)
			k+=1


func _on_level_selected(level_num):
	owner.get_node("AnimationPlayer").play("level_transition")
	yield(owner.get_node("AnimationPlayer"), "animation_finished")
	var _success = get_tree().change_scene("res://levels/level_" + level_num + "/level_" + level_num + ".tscn")
