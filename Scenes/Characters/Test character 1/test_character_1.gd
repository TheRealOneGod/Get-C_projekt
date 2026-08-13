class_name Test_character1 extends CharacterBody2D

@onready var input_component: InputComponent = $InputComponent
@onready var movement_component: MovementComponent = %MovementComponent
@onready var health_component: HealthComponent = %HealthComponent
@onready var animation_component: AnimationComponent = %AnimationComponent
@onready var meele_basic_attack_component: MeeleBasicAttackComponent = %MeeleBasicAttackComponent

func _physics_process(delta: float) -> void:
	# Read inputs
	input_component.update()

	# Read movement
	movement_component.direction = input_component.direction
	movement_component.wants_jump = input_component.jump_pressed
	animation_component.is_jump = input_component.jump_pressed
	meele_basic_attack_component.wants_b_attack = input_component.basic_attack_pressed
	animation_component.is_basic_attack = input_component.basic_attack_pressed
	
	
	movement_component.tick(delta)
	animation_component.animate()
