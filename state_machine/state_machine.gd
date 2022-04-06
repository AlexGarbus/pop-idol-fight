class_name StateMachine
extends Node


signal state_changed(current_state)

export(NodePath) var start_state: NodePath

var _states_map := {}
var _states_stack := []
var _current_state: State = null
var _active := false setget set_active


func _ready() -> void:
	if not start_state:
		start_state = get_child(0).get_path()
	
	for child in get_children():
		var err = child.connect("finished", self, "_change_state")
		if err:
			printerr(err)
	
	initialize(start_state)


func initialize(initial_state: NodePath) -> void:
	set_active(true)
	_states_stack.push_front(get_node(initial_state))
	_current_state = _states_stack[0]
	_current_state._enter()


func set_active(value: bool):
	_active = value
	set_process(value)
	set_physics_process(value)
	set_process_input(value)
	if not _active:
		_states_stack = []
		_current_state = null


func _unhandled_input(event: InputEvent) -> void:
	_current_state._handle_input(event)


func _process(delta: float) -> void:
	_current_state._update(delta)


func _physics_process(delta: float) -> void:
	_current_state._physics_update(delta)


func _change_state(state_name: String):
	if not _active:
		return
	
	_current_state._exit()
	
	if state_name == "previous":
		_states_stack.pop_front()
	else:
		_states_stack[0] = _states_map[state_name]
	
	_current_state = _states_stack[0]
	emit_signal("state_changed", _current_state)
	
	if state_name != "previous":
		_current_state._enter()
