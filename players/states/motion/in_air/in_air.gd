class_name InAir
extends Motion


export var horizontal_move_speed := 450.0


func _update(_delta: float) -> void:
	if _player.look_direction.x < 0:
		_player.play_animation("jump_left")
	else:
		_player.play_animation("jump_right")


func _physics_update(delta: float) -> void:
	var input_direction = _get_input_direction()
	_update_look_direction(input_direction)
	
	_velocity.x = input_direction.x * horizontal_move_speed
	_velocity = _player.move_and_slide(_velocity, Vector2.UP)
	
	if _player.is_on_floor():
		emit_signal("finished", "previous")
	
	._physics_update(delta)
