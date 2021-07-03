extends Node

export(String) var initial_state = "idle"

var current_state = null

var states_map = null

func _ready():
	states_map = {
		"idle": $Idle,
		"move": $Move,
		"stop": $Stop,
	}
	_change_state(initial_state)

	for child in get_children():
		child.connect("finished", self, "_change_state")


func _input(event):
	current_state._handle_input(event)


func _change_state(state_name):
	var dir = null
	if current_state:
		dir = current_state.current_direction
	current_state = states_map[state_name]
	current_state._enter()
	current_state.current_direction = dir


func _physics_process(delta):
	current_state._update(delta)


func _on_animation_finished(anim_name):
	current_state._on_animation_finished(anim_name)
