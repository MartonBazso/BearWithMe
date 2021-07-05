extends Node


var level = null


func load_level(level_num):
	level = load('levels/level_' + level_num + '.tscn')
	if level:
		add_child(level)
