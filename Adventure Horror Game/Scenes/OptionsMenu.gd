extends Control

var resolutions = {"1280x720":Vector2(1280,720),
"1920x1080":Vector2(1920,1080),
"2560x1440":Vector2(2560,1440),
"3840x2160":Vector2(3840,2160),
"5120x1440":Vector2(5120,1440)
}

@onready var ResolutionOptionsButton = $MarginContainer/VBoxContainer/Resolution
@onready var FullscreenCheck = $MarginContainer/VBoxContainer/Fullscreen
@onready var MasterVolume = $MarginContainer/VBoxContainer/Master
@onready var MusicVolume = $MarginContainer/VBoxContainer/Music
@onready var SoundEffectVolume = $MarginContainer/VBoxContainer/VFX

@onready var MasterBus = AudioServer.get_bus_index("Master")
@onready var SoundEffectsBus = AudioServer.get_bus_index("SoundEffects")
@onready var MusicBus = AudioServer.get_bus_index("Music")




#OS.getscreensize()
func _on_back_pressed():
	SceneManager.changeScene(SceneManager.StartMenu)
	SaveSystem.save_game()
	
func _ready():
	AddResolutions()
	SaveSystem.load_game()
	ResolutionOptionsButton.select(SaveSystem.Resolution)
	
	if SaveSystem.Fullscreen:
		FullscreenCheck.button_pressed = true
	else:
		FullscreenCheck.button_pressed = false
		
	MasterVolume.value = SaveSystem.MasterVolume
	MusicVolume.value = SaveSystem.MusicVolume
	SoundEffectVolume.value = SaveSystem.SoundEffectVolume
	
	
#	var currentRes = resolutions.get(key)
#	print(DisplayServer.screen_get_size())
#	ResolutionOptionsButton.select()
#	DisplayServer.window_get_size()
	
func AddResolutions():
	for r in resolutions:
		ResolutionOptionsButton.add_item(r)
	

func _on_resolution_item_selected(index):
	SaveSystem.Resolution = index
	var size = resolutions.get(ResolutionOptionsButton.get_item_text(SaveSystem.Resolution))
	DisplayServer.window_set_size(size)



func _on_fullscreen_toggled(button_pressed):
	SaveSystem.Fullscreen = button_pressed
	if button_pressed:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)



func _on_master_value_changed(value):
	SaveSystem.MasterVolume = value
	AudioServer.set_bus_volume_db(MasterBus, SaveSystem.MasterVolume)
	
func _on_music_value_changed(value):
	SaveSystem.MusicVolume = value
	AudioServer.set_bus_volume_db(MusicBus, SaveSystem.MusicVolume)


func _on_vfx_value_changed(value):
	SaveSystem.SoundEffectVolume = value
	AudioServer.set_bus_volume_db(SoundEffectsBus, SaveSystem.SoundEffectVolume)

