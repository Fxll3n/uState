extends Node
class_name uMachine

@export var initial_state: uState

signal state_transitioned(old_state: StringName, new_state: StringName)

var current_state: uState
var states: Dictionary = {}

func _ready() -> void:
	for child in get_children():
		if child is uState:
			states[child.name.to_lower()] = child
			child.transition.connect(_on_transition)
	
	if initial_state:
		initial_state.enter()  
		current_state = initial_state
	
func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)

func _on_transition(old_state: StringName, new_state: StringName):
	if old_state != current_state.name.to_lower():
		return
	
	var new_state_node = states.get(new_state.to_lower())
	
	if is_instance_valid(new_state_node):
		if current_state:
			current_state.exit()
		
		current_state = new_state_node
		current_state.enter()
		emit_signal.call_deferred("state_transitioned", old_state, new_state)
