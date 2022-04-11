class_name Launch
extends Motion


export var launch_speed := 1000.0
export var min_launch_time := 0.1
export var max_launch_time := 1.0

var launch_direction := Vector2.ZERO

onready var _launch_timer := get_node("../../LaunchTimer")


func _enter() -> void:
	_launch_timer.start()
	_velocity = launch_direction * launch_speed


func _physics_update(_delta: float) -> void:
	_velocity = _player.move_and_slide(_velocity, Vector2.UP)


func initialize(direction: Vector2, time_interpolant: float):
	launch_direction = direction
	_launch_timer.wait_time = min_launch_time + (max_launch_time - min_launch_time) * time_interpolant


func _on_LaunchTimer_timeout() -> void:
	if _player.health == 0:
		emit_signal("finished", "death")
	else:
		emit_signal("finished", "previous")
