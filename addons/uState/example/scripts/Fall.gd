extends "player_state.gd"

var direction: float = 0

func enter() -> void:
	sprite.play("Fall")
	direction = Input.get_axis("left", "right")

func exit() -> void:
	pass

func update(delta) -> void:
	direction = Input.get_axis("left", "right")
	handle_animations()
	
	if player.is_on_floor():
		if direction == 0:
			transition_to("IDLE")
		else:
			transition_to("RUN")

func physics_update(delta) -> void:
	if direction:
		player.velocity.x = move_toward(player.velocity.x, direction * WALK_SPEED * delta, WALK_SPEED)
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, FRICTION * 0.5 * delta)
	
	player.move_and_slide()

func handle_input(event: InputEvent) -> void:
	pass

func handle_animations() -> void:
	if direction < 0:
		sprite.flip_h = true
	elif direction > 0:
		sprite.flip_h = false
