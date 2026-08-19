class_name MeeleBasicAttackComponent extends Node

@export var hitbox: CollisionShape2D # - sem cheš ten actual hitbox 
@export var area: HitboxComponent # - sem chceš areu2D, rodič hurtbodxu, je to duležitý pro rotaci

var face_left := Vector2(-1, 1)
var face_right := Vector2(1, 1)

var wants_b_attack := false # true - hurtbox je aktivní, co je vevnitř dostane dmg, flase - hurbox je vyplej

@export var facing_right = true


func facing_tick():
	if facing_right == false:
		area.set_scale(face_left)
	else:
		area.set_scale(face_right)

func b_attack_tick():
	hitbox.disabled = not wants_b_attack
