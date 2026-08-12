class_name InputComponent extends Node


var direction: float = 0 # 1.0 dívá se doprava, -1.0 dívá se doleva 
var jump_pressed := false 

# při zavolání funkce se variables direction a jump_pressed upraví podle toho, jaké inputy hráč drží. FUNKCE NEHJEBE S POSTAVOU, TO DELA MovementComponent, který zprostředkovává entita, co jeji má ve stromě
func update() -> void:
	direction = Input.get_axis("Move left", "Move right")
	jump_pressed = Input.is_action_just_pressed("Jump")
