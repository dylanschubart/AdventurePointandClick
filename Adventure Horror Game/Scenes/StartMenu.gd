extends Control



func _on_play_pressed():
	SceneManager.changeScene(SceneManager.World)


func _on_options_pressed():
	SceneManager.changeScene(SceneManager.OptionsMenu)


func _on_exit_pressed():
	get_tree().quit()
