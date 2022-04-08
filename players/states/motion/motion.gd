class_name Motion
extends PlayerState


var _velocity := Vector2.ZERO


func _get_input_direction():
	var input_right = Input.get_action_strength("move_right" + _player.input_suffix)
	var input_left = Input.get_action_strength("move_left" + _player.input_suffix)
	var input_direction = Vector2(
			input_right - input_left,
			0
	)
	return input_direction


func _update_look_direction(direction: Vector2) -> void:
	if direction and _player.look_direction != direction:
		_player.look_direction = direction
