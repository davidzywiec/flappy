extends Node

const SAVE_FILE = "user://tappy_scores.JSON"

var _score = 0
var _high_score = 0

func _ready() -> void:
	load_high_score_from_file()
	SignalManager.score.connect(update_score)
	SignalManager.on_plane_die.connect(update_high_score)

func update_score():
	_score += 1

func update_high_score():
	if _high_score < _score:
		_high_score = _score
	_score = 0
	save_high_score_to_file()

func save_high_score_to_file() -> void:
	var score_dic = {"high_score": _high_score}
	var json_data = JSON.stringify(score_dic)
	var file = FileAccess.open(SAVE_FILE,FileAccess.WRITE)
	if file:
		file.store_line(json_data)
	else:
		print("No save file found...")


func load_high_score_from_file() -> void:
	var file = FileAccess.open(SAVE_FILE,FileAccess.READ)
	if file:
		var file_text = file.get_line()
		var json_data = JSON.parse_string(file_text)
		_high_score = json_data.get("high_score")
	else:
		print("No save file found...")