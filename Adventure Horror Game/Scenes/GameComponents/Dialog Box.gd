extends ColorRect

@export var dialogPath = ""
@export var textSpeed = 0.05

var dialog
 
var phraseNum = 0
var finished = false
 
func _ready():
	$Timer.wait_time = textSpeed
	dialog = getDialog()
	assert(dialog, "Dialog not found")
	nextPhrase()
	$Indicator/AnimationPlayer.play("Indicator")
func _process(_delta):
	$Indicator.visible = finished
	if Input.is_action_just_pressed("ui_accept"):
		if finished:
			nextPhrase()
		else:
			$Text.visible_characters = len($Text.text)
 
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
		$"..".queue_free()
		return
	
	finished = false
	
	$Name.bbcode_text = dialog[phraseNum]["Name"]
	$Text.bbcode_text = dialog[phraseNum]["Text"]
	
	$Text.visible_characters = 0
	
	var f = FileAccess.open(dialogPath,FileAccess.READ)
	var img = "res://Sprites/Portraits/" + dialog[phraseNum]["Name"] + dialog[phraseNum]["Emotion"] + ".png"
	print(img)
	if f.file_exists(img):
		$Portrait.texture = load(img)
	else: $Portrait.texture = null
	
	while $Text.visible_characters < len($Text.text):
		$Text.visible_characters += 1
		
		$Timer.start()
		await get_tree().create_timer(textSpeed).timeout
		
	finished = true
	phraseNum += 1
	return
