class_name MeeleBasicAttackComponent extends Node

var face_left = Vector2(-1, 1)
var face_right = Vector2(1, 1)

var wants_b_attack := false # true - hurtbox je aktivní, co je vevnitř dostane dmg, flase - hurbox je vyplej
@export var hurtbox: CollisionShape2D # - sem cheš ten actual hitbox 
@export var area: Area2D # - sem chceš areu2D, rodič hurtboxu, je to duležitý pro rotaci
@export var facing_right = true

func b_attack_tick():
	hurtbox.disabled = not wants_b_attack
	if facing_right == false:
		area.set_scale(face_left)
	else:
		area.set_scale(face_right)
