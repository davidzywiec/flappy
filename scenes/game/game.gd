extends Node2D

const pipes = preload("res://scenes/pipe/pipes.tscn")

@onready var spawnU : Marker2D = $spawnU
@onready var spawnL : Marker2D = $spawnL
@onready var spawnTimer : Timer = $spawnTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#Spawn a pipes scene between two points
func spawn_pipes() -> void:
	pass
