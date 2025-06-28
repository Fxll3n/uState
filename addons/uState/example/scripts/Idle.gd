extends "player_state.gd"

func enter() -> void:
	handle_animations()

func exit() -> void:
	pass

func update(delta) -> void:
	if not player.is_on_floor():
		transition_to("FALL")
	
	var input_direction = Input.get_axis("left", "right")
	if input_direction != 0:
		transition_to("RUN")
		return

func physics_update(delta) -> void:
	player.velocity.x = move_toward(player.velocity.x, 0, FRICTION * delta)
	player.move_and_slide()

func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		transition_to("JUMP")
		return

func handle_animations() -> void:
	sprite.play("Idle")
