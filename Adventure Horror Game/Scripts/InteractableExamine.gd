class_name InteractableExamine extends Area2D

@export var Interact_Name = "none"
@export var Examine_Text = "none"
@export var firstInteraction_Text = "none"
@export var firstInteraction: bool
@export var firstInteractionDialogueBox: bool
@export var DialogueBox: bool

var Interact_Type = "none"
var current_interaction

@onready var InteractLabel = $Label
@onready var Player = $"../../Player"
@onready var Marker = $"../../ItemMarker"
@onready var Inventory = $"../../UserInterface/Inventory"

func _ready():
	Interact_Type = "Examine"
	
func _on_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	InteractLabel.text = Interact_Name
	$Label.show()
	current_interaction = self

func _on_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	InteractLabel.text = ""
	$Label.hide()

func _on_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("LeftMouseClick"):
		Player.interacting = true
		Player.interactable_object = current_interaction
		Marker.show()
		Marker.global_position = current_interaction.position + Vector2(0, -20)

func Examine():
	if firstInteraction:
		firstInteraction = false
		
		if DialogueBox:
			DialogueManager.showDialogueBox(firstInteraction_Text)
			if firstInteractionDialogueBox:
				DialogueBox = false
		else:
			DialogueManager.showDialogueBubble(firstInteraction_Text)
	else:
		if DialogueBox:
			DialogueManager.showDialogueBox(Examine_Text)
		else:
			DialogueManager.showDialogueBubble(Examine_Text)

