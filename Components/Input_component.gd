class_name InputComponent extends Node


var direction: float = 0
var jump_pressed := false

func update() -> void:
	direction = Input.get_axis("Move left", "Move right")
	jump_pressed = Input.is_action_just_pressed("Jump")
	print(direction)
