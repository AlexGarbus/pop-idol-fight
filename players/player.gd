class_name Player
extends KinematicBody2D


signal direction_changed(direction)

export var input_suffix := "_p1"

var look_direction := Vector2.RIGHT setget set_look_direction


func set_look_direction(value: Vector2) -> void:
	look_direction = value
	emit_signal("direction_changed", value)
