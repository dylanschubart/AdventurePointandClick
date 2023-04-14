extends Node

signal active_item_updated

const NUM_INVENTORY_SLOTS = 7

var active_item_slot = null
var active_item = null
var usingItem: bool

var inventory = {
#	0: {"name":"Pliers", "DescriptionText":"TestDuck"},
#	1: {"name":"Hammer", "DescriptionText":"TestNote"},
	0: {"name":"SpringKey", "DescriptionText":"Spring"}
}

func add_item(Name, DescriptionText):
	for i in range(NUM_INVENTORY_SLOTS):
		if inventory.has(i) == false:
			inventory[i] = {"name" : Name, "DescriptionText": DescriptionText}
			return

func remove_item(slotIndex):
	var slot = get_tree().root.get_node("/root/World/UserInterface/Inventory/GridContainer/Slot" + str(slotIndex + 1))
	inventory.erase(slotIndex)
	slot.removeFromSlot()
	usingItem = false
	active_item_slot = null
	active_item = null
	
func select_item(index):
	if index in inventory:
		active_item_slot = index
		active_item = inventory[active_item_slot]
		usingItem = true
	else:
		return

func combine_item(index):
	match active_item["name"]:
		"Pliers":	
			if inventory[index]["name"] == "Spring": 
				inventory[index] = {"name" : "SpringKey", "DescriptionText": "DescriptionText"}
				remove_item(active_item_slot) 
				active_item_slot = null
				active_item = null
				usingItem = false
		"Spring": 
			if inventory[index]["name"] == "Pliers": 
				inventory[index] = {"name" : "SpringKey", "DescriptionText": "DescriptionText"}
				remove_item(active_item_slot)
				active_item_slot = null
				active_item = null
				usingItem = false

func unselect_item():
	active_item_slot = null
	active_item = null
	usingItem = false

func use_Item(interactable_object):
	if interactable_object.get("unlocked"):
		if active_item == null and interactable_object.unlocked == false:
			interactable_object.Examine()
		elif active_item == null and interactable_object.unlocked == true:
			interactable_object.Teleport()
		elif interactable_object.unlocked == false:
			interactable_object.Examine()
		elif !interactable_object.get("unlocked") and active_item == null:
			interactable_object.Examine()
	else:
		match interactable_object.Interact_Name:
			"Shelf" : interactable_object.Shelf(active_item["name"],interactable_object, active_item_slot)
			"Toy" : interactable_object.Toy(active_item["name"],interactable_object, active_item_slot)
			"Door" : interactable_object.Door(active_item["name"],interactable_object, active_item_slot)

func examine_item(index):
	var examineItemText
	var label = get_tree().root.get_node("/root/World/UserInterface/Inventory/Label")
	if index in inventory:
		examineItemText = inventory[index]["DescriptionText"]
		label.text = examineItemText
	else:
		return
