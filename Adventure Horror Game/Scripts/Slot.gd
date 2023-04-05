extends Panel

var default_tex = preload("res://Sprites/UI/DefaultSlot.png")
var empty_tex = preload("res://Sprites/UI/EmptySlot.png")
var active_tex = preload("res://Sprites/UI/ActiveSlot.png")

var default_style: StyleBoxTexture = null
var empty_style: StyleBoxTexture = null
var active_style: StyleBoxTexture = null

var ItemClass = preload("res://Scenes/GameComponents/item.tscn")
var item = null
var slot_index
# Called when the node enters the scene tree for the first time.

func _ready():
	default_style = StyleBoxTexture.new()
	empty_style = StyleBoxTexture.new()
	active_style = StyleBoxTexture.new()
	
	default_style.texture = default_tex
	empty_style.texture = empty_tex
	active_style.texture = active_tex
	
func refresh_style():
	if item == null:
		set('theme_override_styles/panel', empty_style)
	elif PlayerInventory.active_item_slot == slot_index:
		set('theme_override_styles/panel', active_style)
	else:
		set('theme_override_styles/panel', default_style)

func slot_gui_input(_event):
		if Input.is_action_just_pressed("LeftMouseClick") and PlayerInventory.active_item == null:
			PlayerInventory.select_item(slot_index)
		elif Input.is_action_just_pressed("LeftMouseClick") and PlayerInventory.active_item:
			PlayerInventory.combine_item(slot_index)
		if Input.is_action_just_pressed("RightMouseClick"):
			PlayerInventory.examine_item(slot_index)
			
func slot_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func slot_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)

func initialize_item(Interact_Name):
	if item == null:
		item = ItemClass.instantiate()
		add_child(item)
		item.set_item(Interact_Name)
	else:
		item.set_item(Interact_Name)
	refresh_style()
	
func removeFromSlot():
	remove_child(item)
	item = null
	refresh_style()
