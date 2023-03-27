extends Node

var dialogueBox = preload("res://Scenes/GameComponents/DialogueBox.tscn")
var dialogueBubble = preload("res://Scenes/GameComponents/DialogueBubble.tscn")

func showDialogueBox(Player, interactable):
	dialogueBox = dialogueBox.instantiate()
	add_child(dialogueBox)
	var dialogue = get_node("Control/DialogBox")
	dialogue.dialogPath = interactable.Interact_Value
	print(dialogue.dialogPath)
	
func showDialogueBubble(Player, interactable):
	var dialogueBubbleInst = dialogueBubble.instantiate()
	Player.add_child(dialogueBubble)
