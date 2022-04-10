class_name Jump
extends InAir


export var jump_force := 1000.0
export var interrupt_factor := 0.5

var _interrupted:= false


func _enter() -> void:
	_velocity = Vector2(0, -jump_force)
	_interrupted = false


func _handle_input(event: InputEvent) -> void:
	if _velocity.y < 0 and event.is_action_released("jump" + _player.input_suffix):
		_interrupted = true
		_velocity.y *= 0.5
