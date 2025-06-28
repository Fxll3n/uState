extends Label

@onready var u_machine: uMachine = $"../uMachine"

func _ready() -> void:
	u_machine.connect("state_transitioned", _on_transition)

func _on_transition(old_state: StringName, new_state: StringName) -> void:
	text = new_state.to_upper()
