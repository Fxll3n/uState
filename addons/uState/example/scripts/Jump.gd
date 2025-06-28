extends "player_state.gd"

const JUMP_VELOCITY: float = -200
var direction: float = 0

func enter() -> void:
	audio_player.stop()
	audio_player.stream = load("uid://bcuinflibbd2n")
	audio_player.pitch_scale = 1 + randf_range(-0.1, 0.1)
	audio_player.play()
	player.velocity.y = JUMP_VELOCITY
	sprite.play("Jump")
	
	direction = Input.get_axis("left", "right")

func exit() -> void:
	pass

func update(delta) -> void:
	direction = Input.get_axis("left", "right")
	handle_animations()
	
	if player.velocity.y > 0:
		transition_to("FALL")
	
	# Land on ground
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
