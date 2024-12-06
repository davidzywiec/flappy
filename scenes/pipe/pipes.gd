extends Node2D

class_name pipes

const OFF_SCREEN_X : float = -500.0
@onready var oscn : VisibleOnScreenNotifier2D = $OnScreenNotify

func _ready():
	oscn.connect("screen_exited",exit_screen)

func _process(delta: float) -> void:
	if position.x <= OFF_SCREEN_X:
		exit_screen()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if GameManager.game_over:
		pass
	else:
		position.x -= GameManager.SCROLL_SPEED * delta;

func exit_screen():
	queue_free()