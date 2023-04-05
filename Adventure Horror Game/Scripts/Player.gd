extends CharacterBody2D

const speed = 400.0
var target = Vector2.ZERO

var interactable_object
var in_inventory: bool
var dialogueActive: bool
var pickingUP:bool
@export var interacting = false

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@onready var useItemSprite = $"../UserInterface/useItemSprite"

func _ready():
	pass
	$AnimationPlayer.play("Idle")

func _physics_process(_delta):
	
	if Input.is_action_just_pressed("RightMouseClick"):
		PlayerInventory.unselect_item()
		
	if PlayerInventory.usingItem == true:
		var active_Item = PlayerInventory.active_item
		useItemSprite.texture = load("res://Sprites/item_icons/" + active_Item["name"] + ".png")
		useItemSprite.show()
		useItemSprite.position = get_global_mouse_position()
	else:
		useItemSprite.hide()
		
	if Input.is_action_just_pressed("LeftMouseClick") and !in_inventory and !dialogueActive:
		target = get_global_mouse_position()
		navigation_agent.set_target_position(target)
		navigation_agent.set_debug_enabled(true)
		
	if navigation_agent.distance_to_target() > 2 and !navigation_agent.is_navigation_finished():
		var dir = navigation_agent.get_next_path_position() - position
		velocity = dir.normalized() * speed
		move_and_slide()
		$AnimationPlayer.play("Walking")
		
	elif !pickingUP:
		velocity = Vector2.ZERO
		navigation_agent.set_debug_enabled(false)
		$AnimationPlayer.play("Idle")
		if interactable_object == null:
			return
		if position.distance_to(interactable_object.position) < 300 and interacting:
			execute(interactable_object)
			interacting = false
			interactable_object.Marker.hide()
			PlayerInventory.unselect_item()
		else:
			interacting = false
			interactable_object.Marker.hide()
			
func execute(interactable_object):
	match interactable_object.Interact_Type:
		"Examine" : 
			interactable_object.Examine()
		"Pickup" : 
			interactable_object.Pickup()
			$AnimationPlayer.play("PickingUp")
		"Use" : 
			PlayerInventory.use_Item(interactable_object)
		"Receive" : 
			interactable_object.Receive()
