extends Node2D

const SPEED = 120;
@onready var oscn : VisibleOnScreenNotifier2D = $OnScreenNotify

func _ready():
	oscn.connect("screen_exited",exit_screen)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position.x -= SPEED * delta;

func exit_screen():
	queue_free()