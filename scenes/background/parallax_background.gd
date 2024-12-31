extends ParallaxBackground

func _ready() -> void:
	SignalManager.on_plane_die.connect(on_plane_die)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#Move the parallelbackground based on the scroll speed of pipes
	scroll_offset.x -= GameManager.SCROLL_SPEED * delta

func on_plane_die() -> void:
	set_process(false)