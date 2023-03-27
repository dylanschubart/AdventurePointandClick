extends Node

signal active_item_updated

const NUM_INVENTORY_SLOTS = 7

var active_item_slot = null
var active_item = null
var usingItem: bool

var inventory = {
	0: {"name":"Duck", "ExamineText":"TestDuck"},
	1: {"name":"Note", "ExamineText":"TestNote"}
}

func add_item(Interactable):
	for i in range(NUM_INVENTORY_SLOTS):
		if inventory.has(i) == false:
			inventory[i] = {"name" : Interactable.Interact_Name, "ExamineText": Interactable.Examine_Text}
			Interactable.queue_free()
			return

func remove_item(slotIndex):
	var slot = get_tree().root.get_node("/root/Test/UserInterface/Inventory/GridContainer/Slot" + str(slotIndex + 1))
	inventory.erase(slotIndex)
	usingItem = false
	active_item_slot = null
	active_item = null
	slot.removeFromSlot()
	
func select_item(index):
	if index in inventory:
		active_item_slot = index
		active_item = inventory[active_item_slot]
		usingItem = true
	else:
		return

func unselect_item():
	active_item_slot = null
	usingItem = false

func use_Item(interactable_object):
	if active_item == null:
		print(interactable_object.Examine_Text)
	else:
		match interactable_object.Interact_Name:
			"Candle" : interactable_object.candle(active_item["name"], active_item_slot)
			"Bone" : interactable_object.bone(active_item["name"], active_item_slot)

func examine_item(index):
	var examineItemText
	var label = get_tree().root.get_node("/root/Test/UserInterface/Inventory/Label")
	if index in inventory:
		examineItemText = inventory[index]["ExamineText"]
		label.text = examineItemText
	else:
		return

func array_to_string(arr: Array) -> String:
	var s = ""
	for i in arr:
		s += String(i)
	return s
