extends Control

@onready var score_label : Label = $MarginContainer/Score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.score.connect(update_score)

func update_score():
	score_label.text = str(ScoreManager._score)
