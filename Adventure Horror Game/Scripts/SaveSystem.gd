extends Node

var player_file = "user://savegame.save"

var Resolution:int
var Fullscreen:bool
var MasterVolume:float
var MusicVolume:float
var SoundEffectVolume:float
var Inventory:Dictionary
var PlayerPosX:int
var PlayerPosY:int
var CameraTop:int
var CameraBot:int
var CameraLeft:int
var CameraRight:int
var interactions_pickedup:Array
var interactions_receive:Array
var interactions_use:Array

func save_game():
	var file = FileAccess.open(player_file, FileAccess.WRITE)
	var player_data = create_player_data()
	file.store_var(player_data)

func load_game():
	var file = FileAccess.open(player_file, FileAccess.READ)
	if FileAccess.file_exists(player_file):
		var loaded_player_data = file.get_var()
		Resolution = loaded_player_data.Resolution
		Fullscreen = loaded_player_data.Fullscreen
		MasterVolume = loaded_player_data.MasterVolume
		MusicVolume = loaded_player_data.MusicVolume
		SoundEffectVolume = loaded_player_data.SoundEffectVolume
		Inventory = loaded_player_data.Inventory
		interactions_pickedup = loaded_player_data.interactions_pickedup
		interactions_receive = loaded_player_data.interactions_receive
		interactions_use = loaded_player_data.interactions_use
		
		
func delete_save():
	if FileAccess.file_exists(player_file):
		DirAccess.remove_absolute(player_file)

func create_player_data():
	var player_dict = {
		"Resolution" : Resolution,
		"Fullscreen" : Fullscreen,
		"MasterVolume" : MasterVolume,
		"MusicVolume" : MusicVolume,
		"SoundEffectVolume" : SoundEffectVolume,
		"Inventory": Inventory,
		"interactions_pickedup" : interactions_pickedup,
		"interactions_receive" : interactions_receive,
		"interactions_use" : interactions_use
	}
	return player_dict
