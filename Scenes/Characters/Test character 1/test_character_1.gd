extends CharacterBody2D
class_name PlayerController

@export var SPEED := 300.0
@export var JUMP_VELOCITY := -400.0
# knockedbacked := false
@onready var sprite := $"Sprite"
@onready var omni_box := $"Omni box"

enum State {Idle, Walk, Jump, Fall, BaseAttack1}
var state := State.Idle

func _set_state(new_state: State) -> void:
	if state == new_state:
		return
	state = new_state
	match state:
		State.Idle: sprite.play("Idle")
		State.Walk: sprite.play("Walk")
		State.Jump: sprite.play("Jump")
		State.Fall: sprite.play("Fall")
		State.BaseAttack1: sprite.play("Attack")
		
func _on_sprite_animation_finished() -> void:
	if state == State.BaseAttack1:
		state = State.Idle
		print(state)

func _physics_process(delta: float) -> void:
	
	# Handle gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		_set_state(State.Jump)

	# X movement
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
		sprite.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, 100)
		
	# Attack
	if Input.is_action_just_pressed("Attack") and state != State.BaseAttack1:
		_set_state(State.BaseAttack1)
		
	if state != State.BaseAttack1:
		if is_on_floor():
			_set_state(State.Walk if velocity.x else State.Idle)
		else:
			_set_state(State.Fall)
	
	move_and_slide()
