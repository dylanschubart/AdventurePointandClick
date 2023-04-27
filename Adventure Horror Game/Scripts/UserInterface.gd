extends CanvasLayer

@onready var Player = $"../Player"
@onready var Settings = $SettingsMenu

func _process(delta):
	$Inventory.initialize_inventory()


func _on_inventory_mouse_entered():
	Player.in_inventory = true


func _on_inventory_mouse_exited():
	Player.in_inventory = false


func _on_settings_button_pressed():
	Settings.show()
	Player.in_inventory = true


func _on_settings_button_focus_entered():
	Player.in_inventory = true


func _on_settings_button_focus_exited():
	Player.in_inventory = false
