extends Node
class_name uState

signal transition(current_state: StringName, next_state: StringName)

func enter() -> void:
	pass
	
func exit() -> void:
	pass
	
func update(delta) -> void:
	pass
	
func physics_update(delta) -> void:
	pass

func transition_to(new_state: StringName) -> void:
	emit_signal("transition", self.name.to_lower(), new_state.to_lower())
