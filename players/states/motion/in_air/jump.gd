class_name Jump
extends Motion


export var jump_force := 1000.0
export var horizontal_move_speed := 450.0

var _velocity := Vector2.ZERO

onready var _gravity = ProjectSettings.get("physics/2d/default_gravity")


func _enter() -> void:
	_velocity = Vector2(0, -jump_force)


func _physics_update(_delta: float) -> void:
	var input_direction = _get_input_direction()
	
	_velocity.x = input_direction.x * horizontal_move_speed
	_velocity = _player.move_and_slide(_velocity, Vector2.UP)
	_velocity.y += _gravity * _delta
	
	if _player.is_on_floor():
		emit_signal("finished", "previous")
