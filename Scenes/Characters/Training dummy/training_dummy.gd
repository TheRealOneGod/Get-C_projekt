extends CharacterBody2D

@onready var movement_component: MovementComponent = %MovementComponent


func _physics_process(delta: float) -> void:
	movement_component.tick(delta)
