class_name OnGround
extends Motion


var _speed := 0.0
var _velocity := Vector2.ZERO


func _handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump" + _player.input_suffix):
		emit_signal("finished", "jump")
	._handle_input(event)
