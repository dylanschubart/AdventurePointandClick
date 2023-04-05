extends InteractableExamine

@export var ReceiveItemName = "null"
@export var ReceiveItemDescription = "null"

func _ready():
	Interact_Type = "Receive"
	
func Receive():
	print("receive")
	if firstInteraction:
		PlayerInventory.add_item(ReceiveItemName, ReceiveItemDescription)
		Examine()
	else:
		Examine()
