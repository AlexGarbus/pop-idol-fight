class_name Weapon
extends Area2D


signal attack_finished

enum States { IDLE, ATTACKING }

var _state = null

onready var _attack_timer := $AttackTimer


func _ready() -> void:
	_change_state(States.IDLE)


func _change_state(next_state: int) -> void:
	assert(next_state in States.values())
	
	match next_state:
		States.IDLE:
			visible = false
			monitoring = false
		States.ATTACKING:
			visible = true
			monitoring = true
			_attack_timer.start()
			pass
	
	_state = next_state


func _on_AttackTimer_timeout() -> void:
	_change_state(States.IDLE)
	emit_signal("attack_finished")


func _on_PlayerStateMachine_state_changed(current_state: State) -> void:
	if current_state.name == "Melee":
		_change_state(States.ATTACKING)
