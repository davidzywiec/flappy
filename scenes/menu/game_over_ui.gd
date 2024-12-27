extends Control

@onready var timer : Timer = $SpaceReadyTimer
@onready var gameOverLabel : Label = $GameOver
@onready var spaceLabel : Label = $PressSpace
@onready var gameOverSound : AudioStreamPlayer = $GameOverSound
var space_ready : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_plane_die.connect(game_over)
	timer.timeout.connect(show_space)

func game_over() -> void:
	self.visible = true
	gameOverSound.play()
	timer.start()

func _process(delta) -> void:
	if space_ready && Input.is_action_just_pressed("fly"):
		GameManager.call_deferred("change_scene_to_main")


func show_space() -> void:
	gameOverLabel.visible = false
	spaceLabel.visible = true
	space_ready = true