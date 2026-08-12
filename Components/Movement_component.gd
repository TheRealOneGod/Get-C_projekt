class_name MovementComponent extends Node

@export var body: CharacterBody2D
@export var sprite: AnimatedSprite2D
@export var speed := 300.0
@export var jump_velocity := -240.0
@export var gravity_multiplier := 1

var direction: float = 0
var wants_jump := false

func tick(delta: float) -> void:
	if body == null:
		return
		
	body.velocity.x = direction * speed

	if not body.is_on_floor():
		body.velocity += body.get_gravity() * delta * gravity_multiplier

	# Jump
	if wants_jump and body.is_on_floor():
		body.velocity.y = jump_velocity
		
	body.move_and_slide()

	# Rotation
	if direction:
		sprite.flip_h = direction < 0
