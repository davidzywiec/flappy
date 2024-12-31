extends Parallax2D

@onready var sprite : Sprite2D = $Sprite2D
@export var texture : Texture2D
@export var scroll_speed : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var scale_f = get_viewport_rect().size.y / texture.get_height()
	sprite.texture = texture
	sprite.scale = Vector2(scale_f, scale_f)
	repeat_size.x = texture.get_width() * scale_f

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
