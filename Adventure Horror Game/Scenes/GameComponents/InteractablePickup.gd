extends InteractableExamine


@export var Item_Description = "Null"

func _ready():
	Interact_Type = "Pickup"
	
func Pickup():
	Examine()
	PlayerInventory.add_item(Interact_Name, Item_Description)
	queue_free()
	if Interact_Name == "Drawing":
		var pliers = get_tree().root.get_node("/root/Test/Interactions/Interactable_Pliers")
		pliers.show()
	else:
		return
