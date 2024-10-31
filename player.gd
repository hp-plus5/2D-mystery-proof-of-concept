class_name Player
extends CharacterBody2D

const SPEED = 150.0

## @tutorial(Movement Code at 6:22): https://www.youtube.com/watch?v=TQKXU7iSWUU&list=PL9FzW-m48fn2SlrW0KoLT4n5egNdX-W9a&index=3
func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# This came basically premade. For a better version, see tutorial link above.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
