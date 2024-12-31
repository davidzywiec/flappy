extends ParallaxLayer

@onready var sprite : Sprite2D = $Sprite2D
@export var texture : Texture2D
@export var scroll_scale : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Set the layer speed in contrast to the scroll speed
	motion_scale.x = scroll_scale
	#Get the view port rectangle divided by our resolution
	var scale_f = get_viewport_rect().size.y / GameManager.IMG_H
	#Set texture on sprite
	sprite.texture = texture
	#Scale down texture based on screen
	sprite.scale = Vector2(scale_f, scale_f)
	#Move motion based on screen
	motion_mirroring.x = GameManager.IMG_W * scale_f

