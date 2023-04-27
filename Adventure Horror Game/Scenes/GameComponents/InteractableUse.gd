extends InteractableExamine
class_name InteractableUse

@export var Used_Item = "null"
@export var Use_Dialogue = "null"
@export var Didnt_Use_Dialogue = "null"
@export var ReceiveItemName = "null"
@export var ReceiveItemDescription = "null"


var fallenShelf = preload("res://Sprites/Items/ShelfFallen.png")
var brokenToy = preload("res://Sprites/Items/BrokenToy.png")
func _ready():
	Interact_Type = "Use"
	
func Shelf(active_item, interactable_object, active_item_slot):
	if active_item == Used_Item:
		SaveSystem.interactions_use.append(Interact_Name)
		DialogueManager.showDialogueBubble(Use_Dialogue)
		PlayerInventory.remove_item(active_item_slot)
		$Sprite2D.texture = fallenShelf
		$CollisionShape2D.queue_free()
		var Hammer = get_tree().root.get_node("/root/World/Interactions/Interactable_Hammer")
		Hammer.position = Vector2(1501, 799)
	else:
		DialogueManager.showDialogueBubble(Didnt_Use_Dialogue)

func Toy(active_item, interactable_object, active_item_slot):
	if active_item == Used_Item:
		SaveSystem.interactions_use.append(Interact_Name)
		DialogueManager.showDialogueBubble(Use_Dialogue)
		PlayerInventory.remove_item(active_item_slot)
		PlayerInventory.add_item(ReceiveItemName, ReceiveItemDescription)
		$Sprite2D.texture = brokenToy
		$CollisionShape2D.hide()
	else:
		DialogueManager.showDialogueBubble(Didnt_Use_Dialogue)
