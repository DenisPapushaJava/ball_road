extends Node
var current_level: int = 1
var unlocked_levels: Array = [1]
var scores: Dictionary = {}

const SAVE_FILE:= "user://savegame.json"
const LEVEL_PATH := "res://scenes/levels/level_%d.tscn"

func save() -> void:
	var save_data = {
		"progress":{
			"current_level": current_level,
			"unlocked_levels": unlocked_levels
		},
		"scores": scores
	} 
	var file = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(save_data, "\t"))
		file.close()
		print("SAVE")
	else :
		push_error("file save not found")

func  load() -> void:
	if !FileAccess.file_exists(SAVE_FILE):
		return
	var file = FileAccess.open(SAVE_FILE, FileAccess.READ)
	if file:
		var text = file.get_as_text()
		file.close()
		var data = JSON.parse_string(text)
		if typeof(data) == TYPE_DICTIONARY:
			current_level = data.progress.current_level
			unlocked_levels = data.progress.unlocked_levels
			scores = data.scores
			print("Load")
		else:
			push_error("Eror JSON parsing")

func load_level(index: int) -> void:
	var path = LEVEL_PATH % index
	if ResourceLoader.exists(path):
		get_tree().change_scene_to_file(path)
		current_level = index
		print("level load")
	else :
		print("level not found")
func load_next_level() -> void:
	load_level(current_level + 1)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
