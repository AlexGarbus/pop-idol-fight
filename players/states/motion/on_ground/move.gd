class_name Move
extends OnGround


export var move_speed := 450.0


func _handle_input(event: InputEvent) -> void:
	._handle_input(event)


func _physics_update(delta: float) -> void:
	var input_direction = _get_input_direction()
	if not input_direction:
		emit_signal("finished", "idle")
	_update_look_direction(input_direction)
	
	_velocity = input_direction * move_speed
	._physics_update(delta)
	_velocity = _player.move_and_slide(_velocity, Vector2.UP)
