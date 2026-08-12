class_name Test_character1 extends CharacterBody2D

@onready var input_component: InputComponent = $InputComponent
@onready var movement_component: MovementComponent = %MovementComponent

func _physics_process(delta: float) -> void:
	# Read inputs
	input_component.update()

	# Read movement
	movement_component.direction = input_component.direction
	movement_component.wants_jump = input_component.jump_pressed
	movement_component.tick(delta)
