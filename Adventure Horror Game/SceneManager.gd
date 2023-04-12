extends CanvasLayer

const World = ("res://Scenes/World.tscn")
const StartMenu = ("res://Scenes/StartMenu.tscn")
const OptionsMenu = ("res://Scenes/OptionsMenu.tscn")

func changeScene(scenePath):
	get_tree().change_scene_to_file(scenePath)
