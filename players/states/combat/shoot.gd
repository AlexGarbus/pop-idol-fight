class_name Shoot
extends PlayerState



func _on_ProjectileSpawner_cooldown_finished() -> void:
	emit_signal("finished", "previous")
