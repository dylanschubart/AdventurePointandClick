extends Control

@onready var MasterBus = AudioServer.get_bus_index("Master")
@onready var SoundEffectsBus = AudioServer.get_bus_index("SoundEffects")
@onready var MusicBus = AudioServer.get_bus_index("Music")
@onready var Buttons = $MarginContainer

func _ready():
	SaveSystem.load_game()
	
	PlayerInventory.inventory = SaveSystem.Inventory
	print(SaveSystem.Inventory)
	
	if SaveSystem.Fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	
	AudioServer.set_bus_volume_db(MasterBus, SaveSystem.MasterVolume)
	AudioServer.set_bus_volume_db(MusicBus, SaveSystem.MusicVolume)
	AudioServer.set_bus_volume_db(SoundEffectsBus, SaveSystem.SoundEffectVolume)
	
func _on_play_pressed():
	Buttons.hide()
	SceneManager.changeScenewithTransition(SceneManager.World)

func _on_options_pressed():
	SceneManager.changeScene(SceneManager.OptionsMenu)


func _on_exit_pressed():
	get_tree().quit()


func _on_button_pressed():
	SaveSystem.delete_save()
	
	PlayerInventory.inventory = PlayerInventory.startInventory
	SaveSystem.Inventory = PlayerInventory.inventory
	SaveSystem.interactions_pickedup = []
	SaveSystem.interactions_receive = []
	SaveSystem.interactions_use = []
	print(SaveSystem.Inventory)
	print(SaveSystem.interactions_pickedup)
	AudioServer.set_bus_volume_db(MasterBus, 0)
	AudioServer.set_bus_volume_db(MusicBus, 0)
	AudioServer.set_bus_volume_db(SoundEffectsBus, 0)
