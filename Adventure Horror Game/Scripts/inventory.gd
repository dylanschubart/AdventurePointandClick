extends Control

@onready var inventory_slots = $GridContainer

func _ready():
	var slots = inventory_slots.get_children()
	for i in range(slots.size()):
		slots[i].slot_index = i
		slots[i].gui_input.connect(slots[i].slot_gui_input)
		slots[i].mouse_entered.connect(slots[i].slot_mouse_entered)
		slots[i].mouse_exited.connect(slots[i].slot_mouse_exited)
	initialize_inventory()

func initialize_inventory():
	var slots = inventory_slots.get_children()
	for i in range(slots.size()):
		if PlayerInventory.inventory.has(i):
			slots[i].initialize_item(PlayerInventory.inventory[i]["name"])

