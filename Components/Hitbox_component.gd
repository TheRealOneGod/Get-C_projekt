class_name HitboxComponent extends Area2D

signal hit(hurtbox: HurtboxComponent)

@export var damage: float = 1.0
@export var cooldown: float = 0.3


func _init() -> void:
	monitoring = true
	monitorable = false
	area_entered.connect(_on_area_entered)
	
func _on_area_entered(area: Area2D) -> void:
	if area is not HurtboxComponent:
		return
	
	var hurtbox := area as HurtboxComponent
	
	print("Hello")

	# hurtbox.take_hit(self)
	# hit.emit(hurtbox)
