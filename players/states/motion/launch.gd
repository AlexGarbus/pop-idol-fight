class_name Launch
extends Motion


export var launch_speed := 1000.0

var launch_direction := Vector2.ZERO

onready var _launch_timer := get_node("../../LaunchTimer")


func _enter() -> void:
	_launch_timer.start()
	_velocity = launch_direction * launch_speed


func _physics_update(_delta: float) -> void:
	_velocity = _player.move_and_slide(_velocity, Vector2.UP)


func _on_LaunchTimer_timeout() -> void:
	emit_signal("finished", "previous")
