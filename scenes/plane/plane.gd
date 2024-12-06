extends CharacterBody2D

const GRAVITY = 600.0
const POWER = -300.0

@onready var anim_player : AnimationPlayer = $AnimationPlayer
@onready var anim_sprite : AnimatedSprite2D = $AnimatedSprite2D

signal on_plane_die

func _physics_process(delta: float) -> void:

	velocity.y += GRAVITY * delta
	fly()

	move_and_slide()

	if is_on_floor():
		die()


func fly() -> void:
	if Input.is_action_just_pressed("fly"):
		velocity.y = POWER
		anim_player.play("power")


func die() -> void:
	anim_sprite.stop()
	set_physics_process(false)
	on_plane_die.emit()

	