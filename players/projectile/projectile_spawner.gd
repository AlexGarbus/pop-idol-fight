class_name ProjectileSpawner
extends Node2D


signal cooldown_finished

var _projectile := preload("projectile.tscn")
var _player: Player

onready var _cooldown_timer = $CooldownTimer


func _ready() -> void:
	yield(owner, "ready")
	_player = owner as Player
	assert(_player != null)


func _spawn() -> void:
	_cooldown_timer.start()
	var new_projectile: Projectile = _projectile.instance()
	add_child(new_projectile)
	new_projectile.position = global_position
	new_projectile.direction = _player.look_direction
	new_projectile.scale.x = ceil(_player.look_direction.x)


func _on_CooldownTimer_timeout() -> void:
	emit_signal("cooldown_finished")


func _on_PlayerStateMachine_state_changed(current_state: State) -> void:
	if current_state.name == "Shoot":
		_spawn()
	elif not _cooldown_timer.is_stopped():
		_cooldown_timer.stop()
