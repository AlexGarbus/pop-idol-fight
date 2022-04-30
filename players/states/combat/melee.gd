class_name Melee
extends PlayerState


func _enter() -> void:
	if _player.look_direction.x < 0:
		_player.play_animation("melee_left")
	else:
		_player.play_animation("melee_right")


func _exit() -> void:
	if _player.look_direction.x < 0:
		_player.play_animation("idle_left")
	else:
		_player.play_animation("idle_right")


func _on_Weapon_attack_finished() -> void:
	emit_signal("finished", "previous")
