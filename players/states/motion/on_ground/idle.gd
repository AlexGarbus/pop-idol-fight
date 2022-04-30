class_name Idle
extends OnGround


func _enter() -> void:
	if _player.look_direction.x < 0:
		_player.play_animation("idle_left")
	else:
		_player.play_animation("idle_right")


func _handle_input(event: InputEvent) -> void:
	._handle_input(event)


func _physics_update(delta: float) -> void:
	var input_direction = _get_input_direction()
	if input_direction.x:
		emit_signal("finished", "move")
	
	_player.move_and_slide(_velocity, Vector2.UP)

	._physics_update(delta)
