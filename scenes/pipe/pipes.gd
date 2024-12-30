extends Node2D

class_name pipes

const OFF_SCREEN_X : float = -500.0
@onready var oscn : VisibleOnScreenNotifier2D = $OnScreenNotify
@onready var uPipe : Area2D = $Upper
@onready var lPipe : Area2D = $Lower
@onready var laser : Area2D = $laser
@onready var score_sound : AudioStreamPlayer2D = $onScoreSound


func _ready():
	oscn.connect("screen_exited",exit_screen)
	SignalManager.on_plane_die.connect(on_plane_die)
	uPipe.body_entered.connect(on_collision)
	lPipe.body_entered.connect(on_collision)
	laser.body_entered.connect(score)


func _process(delta: float) -> void:
	if position.x <= OFF_SCREEN_X:
		exit_screen()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
		position.x -= GameManager.SCROLL_SPEED * delta;

func exit_screen():
	queue_free()

func on_plane_die():
	set_process(false)
	set_physics_process(false)

func on_collision(body: Node2D):
	if body is Tappy:
		SignalManager.on_plane_die.emit()
	
func score(body: Node2D):
	if body is Tappy:
		score_sound.play()
		SignalManager.score.emit()
		
