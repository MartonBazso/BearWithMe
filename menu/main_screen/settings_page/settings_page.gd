extends Control

var is_gui_active = false

func _ready():
	for i in $VBoxContainer.get_children():
		for j in i.get_children():
			if j is Control:
				j.connect("gui_input", self, "_on_control_gui_input")


func _on_control_gui_input(event):
	is_gui_active = true
	$Timer.start()


func _on_Timer_timeout():
	is_gui_active = false
