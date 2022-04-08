class_name Melee
extends PlayerState


func _on_Weapon_attack_finished() -> void:
	emit_signal("finished", "previous")
