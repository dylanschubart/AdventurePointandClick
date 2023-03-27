extends TextureRect

@export var dialogPath = ""
@export var textSpeed = 0.05

var dialog
 
var phraseNum = 0
var finished = false
 
func _ready():
	get_parent().hide()

func start():
	phraseNum = 0
	get_parent().show()
	$Timer.wait_time = textSpeed
	$TimerDisappear.start()
	dialog = getDialog()
	assert(dialog, "Dialog not found")
	nextPhrase()
 
func getDialog() -> Array:
	var f = FileAccess.open(dialogPath,FileAccess.READ)
	assert(FileAccess.file_exists(dialogPath), "File path does not exist")
	
	var json_object = JSON.new()
	json_object.parse(f.get_as_text())
	var output = json_object.get_data()
	print(output)
	
	if typeof(output) == TYPE_ARRAY:
		return output
	else:
		return []
 
func nextPhrase() -> void:
	if phraseNum >= len(dialog):
		get_parent().hide()
		return
	
	finished = false
	
	$Text.bbcode_text = dialog[phraseNum]["Text"]
	
	$Text.visible_characters = 0
	
	var f = FileAccess.open(dialogPath,FileAccess.READ)
	
	while $Text.visible_characters < len($Text.text):
		$Text.visible_characters += 1
		
		$Timer.start()
		await get_tree().create_timer(textSpeed).timeout
		
	finished = true
	phraseNum += 1
	return


func _on_timer_disappear_timeout():
	get_parent().hide()
