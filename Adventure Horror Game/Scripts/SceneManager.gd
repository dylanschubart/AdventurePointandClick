extends CanvasLayer

const World = ("res://Scenes/World.tscn")
const StartMenu = ("res://Scenes/StartMenu.tscn")
const OptionsMenu = ("res://Scenes/OptionsMenu.tscn")
const Cafeteria = ("res://Scenes/Cafeteria.tscn")

func _ready():
	get_node("ColorRect").hide()
	get_node("Label").hide()

func changeScenewithTransition(scenePath):
	get_node("ColorRect").show()
	get_node("Label").show()
	get_node("AnimationPlayer").play("TransIn")
	await get_node("AnimationPlayer").animation_finished
	
	get_tree().change_scene_to_file(scenePath)
	
	get_node("AnimationPlayer").play("TransOut")
	await get_node("AnimationPlayer").animation_finished
	get_node("ColorRect").hide()
	get_node("Label").hide()

func changeScene(scenePath):
	get_tree().change_scene_to_file(scenePath)
