extends CharacterBody2D

@export var max_gravity: float = 980

@onready var statemachine: uMachine = $uMachine

func _input(event: InputEvent) -> void:
	var current_state = statemachine.current_state
	if current_state.has_method("handle_input"):
		current_state.handle_input(event)


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += max_gravity * delta
		clampf(velocity.y, 0, max_gravity)
	
	move_and_slide()
