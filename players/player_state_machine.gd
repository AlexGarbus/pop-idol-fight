class_name PlayerStateMachine
extends StateMachine


var _player: Player

onready var _idle := $Idle
onready var _move := $Move
onready var _jump := $Jump
onready var _fall := $Fall
onready var _melee := $Melee
onready var _shoot := $Shoot
onready var _launch := $Launch


func _ready() -> void:
	_states_map = {
		"idle": _idle,
		"move": _move,
		"jump": _jump,
		"fall": _fall,
		"melee": _melee,
		"shoot": _shoot,
		"launch": _launch,
	}
	
	yield(owner, "ready")
	_player = owner as Player
	assert(_player != null)


func _unhandled_input(event: InputEvent) -> void:
	if _is_change_state_input(event, "melee"):
		_change_state("melee")
		return
	if _is_change_state_input(event, "shoot"):
		_change_state("shoot")
		return
	
	_current_state._handle_input(event)


func _change_state(state_name: String) -> void:
	if not _active:
		return
	
	if state_name == "launch" and _current_state in [_melee, _shoot]:
		_states_stack.pop_front()
	
	if state_name in ["jump", "fall", "melee", "shoot", "launch"]:
		_states_stack.push_front(_states_map[state_name])
	
	._change_state(state_name)


func _is_change_state_input(event: InputEvent, action: String) -> bool:
	if event.is_action_pressed(action + _player.input_suffix):
		if not _current_state in [_melee, _shoot]:
			return true
	return false


func _on_Player_attacked(attacker: Area2D) -> void:
	_launch.launch_direction = (_player.global_position - attacker.global_position).normalized()
	_change_state("launch")
