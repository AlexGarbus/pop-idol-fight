class_name InAir
extends Motion


export var horizontal_move_speed := 450.0

onready var _gravity = ProjectSettings.get("physics/2d/default_gravity")


func _physics_update(delta: float) -> void:
	var input_direction = _get_input_direction()
	
	_velocity.x = input_direction.x * horizontal_move_speed
	_velocity = _player.move_and_slide(_velocity, Vector2.UP)
	
	if _player.is_on_floor():
		emit_signal("finished", "previous")
	
	_velocity.y += _gravity * delta
