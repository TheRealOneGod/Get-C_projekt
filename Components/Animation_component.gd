class_name AnimationComponent extends Node

""" Hanluje animaci spritu. Při nic nedělání Idle, když body chodí tak Walk/Fall (tzv. idle animations, tj. animace co hrají neustále unless said otherwise). Zbytek se bude most likely měnit case to case"""

@export var sprite: AnimatedSprite2D # s čím animuju
@export var body: CharacterBody2D	# co kontroluju 

var is_jump := false
var is_basic_attack := false
var overriden := false # bude řešit nechání dohrání animací. Pokud animace má mít prio, tak při jejím přehrání změň overriden na true

func _ready() -> void:
	sprite.connect("animation_finished", attackoverride) # napojení, při konci animace spritu se spustí funkce dole, která jen uvolní override, prio skončí po dorhání animace (jak má být)

func animate() -> void:
	
	# animate attack
	if is_basic_attack:
		sprite.play("Attack")
		overriden = true
	
	# animate jump
	if is_jump and body.is_on_floor():
		sprite.play("Jump")

	# handle idle animations 
	if not overriden:
		if body.is_on_floor():
			sprite.play("Walk") if body.velocity.x else sprite.play("Idle")
		else:
			sprite.play("Fall")

# konec pria, idle animace se spouští
func attackoverride():
	overriden = false
