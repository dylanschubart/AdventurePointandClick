extends InteractableExamine

@export var ReceiveItemName = "null"
@export var ReceiveItemDescription = "null"

func _ready():
	Interact_Type = "Receive"
	if SaveSystem.interactions_receive:
		for name in SaveSystem.interactions_receive:
			if name == Interact_Name:
				firstInteraction = false
				
func Receive():
	print("receive")
	if firstInteraction:
		SaveSystem.interactions_receive.append(Interact_Name)
		PlayerInventory.add_item(ReceiveItemName, ReceiveItemDescription)
		Examine()
	else:
		Examine()
