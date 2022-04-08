class_name PlayerStateMachine
extends StateMachine


onready var _idle := $Idle
onready var _move := $Move
onready var _jump := $Jump
onready var _fall := $Fall
onready var _melee := $Melee
onready var _player: Player


func _ready() -> void:
	_states_map = {
		"idle": _idle,
		"move": _move,
		"jump": _jump,
		"fall": _fall,
		"melee": _melee
	}
	
	yield(owner, "ready")
	_player = owner as Player
	assert(_player != null)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("melee" + _player.input_suffix):
		if _current_state in [_melee]:
			return
		_change_state("melee")
		return
	
	_current_state._handle_input(event)


func _change_state(state_name: String):
	if not _active:
		return
		
	if state_name in ["jump", "fall", "melee"]:
		_states_stack.push_front(_states_map[state_name])
	
	._change_state(state_name)
