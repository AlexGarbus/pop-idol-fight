class_name PlayerState
extends State


var _player: Player


func _ready() -> void:
	yield(owner, "ready")
	_player = owner as Player
	assert(_player != null)
