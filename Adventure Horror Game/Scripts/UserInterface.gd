extends CanvasLayer

@onready var Player = $"../Player"

func _process(delta):
	$Inventory.initialize_inventory()


func _on_inventory_mouse_entered():
	Player.in_inventory = true


func _on_inventory_mouse_exited():
	Player.in_inventory = false
