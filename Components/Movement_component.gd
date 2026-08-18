class_name MovementComponent extends Node

""" Dej čemukoliv, co chceš aby se hejbalo, mělo by to byt univerzalni, kdyžtak lmk. HANDLUJE GRAVITACI! """

@export var body: Node2D # s kým hejbu
@export var sprite: Node2D # obrázek toho s kým hejbu
@export var speed := 300.0 # rychlost pohybu
@export var jump_velocity := -240.0 # síla skoku, musí být negativní, čím nižší tim víc skákat
@export var gravity_multiplier := 1 # pro tlusťochy. 1 je neutral

var direction: float = 0 # kam se postava hejbe/bude hejbat
var wants_jump := false # chce postava skočit?

# funkci by měl rodič volat na každý physics process, basically pohne s postavou tak, jak by měla, jak říká direction/wants jump etc.
func tick(delta: float) -> void:
	# pokud nemá otce nic nedělej, prstě guardrail
	if body == null: 
		return
	
	# rodič se posune
	body.velocity.x = direction * speed

	# handle gravity
	if not body.is_on_floor():
		body.velocity += body.get_gravity() * delta * gravity_multiplier

	# Jump
	if wants_jump and body.is_on_floor():
		body.velocity.y = jump_velocity
		
	# formalitka
	body.move_and_slide()

	# rotace spritu
	if direction:
		sprite.flip_h = direction < 0
