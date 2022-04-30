class_name Shoot
extends PlayerState


func _enter() -> void:
	if _player.look_direction.x < 0:
		_player.play_animation("idle_left")
	else:
		_player.play_animation("idle_right")


func _on_ProjectileSpawner_cooldown_finished() -> void:
	emit_signal("finished", "previous")
