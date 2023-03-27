extends Node



func showDialogueBox(interactable):
	var dialogueBox = get_tree().root.get_node("/root/Test/UserInterface/DialogueBox/DialogueBox")
	dialogueBox.dialogPath = interactable.Interact_Value
	dialogueBox.start()

func showDialogueBubble(dialoguepath):
	var dialogueBubble = get_tree().root.get_node("/root/Test/Player/DialogueBubble/DialogueBubble")
	dialogueBubble.dialogPath = dialoguepath
	dialogueBubble.start()
