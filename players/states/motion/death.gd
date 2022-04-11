class_name Death
extends Motion


func _enter() -> void:
	_player.set_fighting(false)


func _exit() -> void:
	_player.set_fighting(true)


func _physics_update(delta: float) -> void:
	_player.move_and_slide(_velocity, Vector2.UP)
	._physics_update(delta)
