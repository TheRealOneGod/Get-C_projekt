class_name AnimationComponent extends Node

@export var sprite: AnimatedSprite2D

func _ready() -> void:
	sprite.play("Idle")
