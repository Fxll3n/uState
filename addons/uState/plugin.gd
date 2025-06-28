@tool
extends EditorPlugin


func _enter_tree() -> void:
	add_custom_type("uMachine", "Node", preload("res://addons/uState/scripts/state_machine.gd"), preload("res://addons/uState/icons/uMachineIcon.svg"))
	add_custom_type("uState", "Node", preload("res://addons/uState/scripts/state.gd"), preload("res://addons/uState/icons/uStateIcon.svg"))

func _exit_tree() -> void:
	remove_custom_type("uMachine")
	remove_custom_type("uState")
