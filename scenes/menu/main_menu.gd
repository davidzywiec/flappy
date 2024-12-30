extends Control

@onready var high_score_label : Label = $MarginContainer/CurrentHighScoreLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	high_score_label.text = str(ScoreManager._high_score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#Start Game if space is pressed
	if Input.is_action_just_pressed("fly"):
		GameManager.start_game()
