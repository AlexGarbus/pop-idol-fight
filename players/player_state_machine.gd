class_name PlayerStateMachine
extends StateMachine


onready var _idle = $Idle
onready var _move = $Move


func _ready() -> void:
	_states_map = {
		"idle": _idle,
		"move": _move,
	}
