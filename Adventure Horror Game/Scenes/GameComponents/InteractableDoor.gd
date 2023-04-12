extends InteractableUse

@export var newDoorLocation: Marker2D
@export var unlocked: bool
@export var limitBot = 0
@export var limitTop = 0
@export var limitLeft = 0
@export var limitRight = 0

func Door(active_item, interactable_object, active_item_slot):
	if active_item == Used_Item and !unlocked:
		DialogueManager.showDialogueBubble(Use_Dialogue)
		PlayerInventory.remove_item(active_item_slot)
		unlocked = true
		print(active_item)
	elif active_item != Used_Item and !unlocked:
		DialogueManager.showDialogueBubble(Didnt_Use_Dialogue)
	
func Teleport():
	%WorldManager.TeleportRoom(newDoorLocation, limitBot, limitTop, limitLeft, limitRight)
