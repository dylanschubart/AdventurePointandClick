class_name Interactable extends Area2D

@export var Interact_Name = "none"
@export var Interact_label = "none"
@export var Interact_Type = "none"
@export var Interact_Value = "none"
@export var Examine_Text = "none"

var current_interaction

@onready var InteractLabel = $Label
@onready var Player = $"../../Player"
@onready var Marker = $"../../ItemMarker"
@onready var Inventory = $"../../UserInterface/Inventory"

func _on_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	InteractLabel.text = Interact_label
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

func candle(active_item_name, active_item_slot):
	if active_item_name == "Note":
		print("burned note")
		PlayerInventory.remove_item(active_item_slot)
	else:
		print("that doesn't work")
		
func bone(active_item_name, active_item_slot):
	if active_item_name == "Duck":
		print("Duck ate Bone")
		PlayerInventory.remove_item(active_item_slot)
	else:
		print("that doesn't work")
