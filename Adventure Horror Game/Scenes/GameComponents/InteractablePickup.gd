extends InteractableExamine


@export var Item_Description = "Null"

func _ready():
	Interact_Type = "Pickup"
	
func Pickup():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	Examine()
	PlayerInventory.add_item(Interact_Name, Item_Description)
	queue_free()
	SaveSystem.interactions_pickedup.append(Interact_Name)
	print(SaveSystem.interactions_pickedup)
	if Interact_Name == "Drawing":
		SoundEffect.play()
		var pliers = get_tree().root.get_node("/root/World/Interactions/Interactable_Pliers")
		pliers.show()
	else:
		return
