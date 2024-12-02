extends Node2D

const pipes = preload("res://scenes/pipe/pipes.tscn")

@onready var spawnU : Marker2D = $spawnU
@onready var spawnL : Marker2D = $spawnL
@onready var spawnTimer : Timer = $spawnTimer
@onready var pipeHolder : Node = $PipeHolder

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Connect spawnTimer
	spawnTimer.connect("timeout",spawn_pipes)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#Spawn a pipes scene between two points
func spawn_pipes() -> void:
	var rng = RandomNumberGenerator.new()
	var pos_x = spawnU.global_position.x
	var pos_y = rng.randf_range(spawnU.global_position.y,spawnL.global_position.y)
	var pscene : pipes = pipes.instantiate()
	pscene.global_position = Vector2(pos_x,pos_y)
	pipeHolder.add_child(pscene)
	
	
