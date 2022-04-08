class_name PlayerStateMachine
extends StateMachine


onready var _idle = $Idle
onready var _move = $Move
onready var _jump = $Jump
onready var _fall = $Fall


func _ready() -> void:
	_states_map = {
		"idle": _idle,
		"move": _move,
		"jump": _jump,
		"fall": _fall,
	}


func _change_state(state_name: String):
	if not _active:
		return
		
	if state_name in ["jump", "fall"]:
		_states_stack.push_front(_states_map[state_name])
	
	._change_state(state_name)
