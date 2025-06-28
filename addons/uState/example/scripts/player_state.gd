extends uState

@onready var player: CharacterBody2D = self.owner # gets the player.tscn root node.
@onready var sprite: AnimatedSprite2D = %AnimatedSprite2D
@onready var audio_player: AudioStreamPlayer2D = %AudioStreamPlayer2D

const WALK_SPEED: float = 2500
const FRICTION: float = 300


func handle_input(event: InputEvent) -> void:
	pass

func handle_animations() -> void:
	pass
