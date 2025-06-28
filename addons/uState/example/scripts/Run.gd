extends "player_state.gd"

var direction: float = 0

@onready var walk_audio_timer: Timer = Timer.new()

func _ready() -> void:
	add_child(walk_audio_timer)
	walk_audio_timer.one_shot = true
	

func enter() -> void:
	sprite.play("Run")
	audio_player.stream = load("uid://b5hhf45ngeurs")
	direction = Input.get_axis("left", "right")

func exit() -> void:
	pass

func update(delta) -> void:
	direction = Input.get_axis("left", "right")
	handle_animations()
	
	if not player.is_on_floor():
		transition_to("FALL")
	
	if player.velocity.x == 0 and direction == 0:
		transition_to("IDLE")
	
func physics_update(delta) -> void:
	if direction:
		player.velocity.x = move_toward(player.velocity.x, direction * WALK_SPEED * delta, WALK_SPEED)
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, FRICTION * delta)
		
	player.move_and_slide()

func handle_input(event: InputEvent) -> void:
	
	if event.is_action_pressed("jump"):
		transition_to("JUMP")
		return
	
	

func handle_animations() -> void:
	if direction < 0:
		sprite.flip_h = true
	elif direction > 0:
		sprite.flip_h = false
	
	if walk_audio_timer.is_stopped():
		audio_player.pitch_scale = 1 + randf_range(-0.3, 0.3)
		audio_player.play()
		walk_audio_timer.start(0.3)
