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
			$GridContainer.add_child(instance)
			k+=1


func _on_BackButton_pressed():
	owner.get_node("AnimationPlayer").play_backwards("menu_transition")
