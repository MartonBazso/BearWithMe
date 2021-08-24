extends Node

var speed = 2.5
var currentLevel = 1
var maxLevelReached = 1
var isVolumeOn = false
var money = 0
var screen_shake = true
var maxLevelOnFirstPage = 30
var mouseInGUI = false
var sensitivity = 3000


func save_game():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	save_game.store_string(to_json(get_params()))
	save_game.close()
	return save_game.get_path_absolute()

func get_params():
	var save_dict = {
		"speed" : speed,
		"currentLevel" : currentLevel,
		"maxLevelReached" : maxLevelReached,
		"isVolumeOn" : isVolumeOn,
		"money" : money,
		"screen_shake" : screen_shake,
		"maxLevelOnFirstPage" : maxLevelOnFirstPage
	}
	return save_dict


func load_game():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return

	save_game.open("user://savegame.save", File.READ)
	while !save_game.eof_reached():
		var saved_file = parse_json(save_game.get_line())
		for i in saved_file.keys():
			set(i, saved_file[i])
	save_game.close()


func delete_save():
	var save_game = File.new()
	if save_game.file_exists("user://savegame.save"):
		var dir = Directory.new()
		dir.remove("user://savegame.save")
