class_name Idle
extends OnGround


func _handle_input(event: InputEvent) -> void:
	._handle_input(event)


func _physics_update(delta: float) -> void:
	var input_direction = _get_input_direction()
	if input_direction.x:
		emit_signal("finished", "move")

	._physics_update(delta)
