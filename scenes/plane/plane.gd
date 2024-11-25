extends CharacterBody2D

const GRAVITY = 600.0
const POWER = -300.0


func _physics_process(delta: float) -> void:

	velocity.y += GRAVITY * delta
	fly()

	move_and_slide()


func fly() -> void:
	if Input.is_action_just_pressed("fly"):
		velocity.y = POWER
