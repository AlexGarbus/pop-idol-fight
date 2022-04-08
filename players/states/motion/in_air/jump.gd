class_name Jump
extends InAir


export var jump_force := 1000.0


func _enter() -> void:
	_velocity = Vector2(0, -jump_force)
