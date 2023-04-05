extends Node



func showDialogueBox(dialoguepath):
	var dialogueBox = get_tree().root.get_node("/root/Test/UserInterface/DialogueBox/DialogueBox")
	dialogueBox.dialogPath = dialoguepath
	dialogueBox.start()

func showDialogueBubble(dialoguepath):
	var dialogueBubble = get_tree().root.get_node("/root/Test/Player/DialogueBubble/DialogueBubble")
	dialogueBubble.dialogPath = dialoguepath
	dialogueBubble.start()
