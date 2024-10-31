class_name Player
extends CharacterBody2D

const MAX_SPEED = 80.0
const ACCELERATION = 500
const FRICTION = 500

## @tutorial(Movement Code at 6:22): https://www.youtube.com/watch?v=TQKXU7iSWUU&list=PL9FzW-m48fn2SlrW0KoLT4n5egNdX-W9a&index=3
func _physics_process(delta: float) -> void:

	# 3.2 way?
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()

	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

	move_and_collide(velocity * delta)
