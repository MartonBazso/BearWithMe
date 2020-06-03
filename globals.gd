extends Node

export(int) var speed = 3
export(int) var currentLevel = 1
export(int) var maxLevelReached = 15
export(bool) var isVolumeOn = false
export(int) var money = 0
export(bool) var screen_shake = true
export(int) var maxLevelOnFirstPage = 30

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
		"money" : money
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
