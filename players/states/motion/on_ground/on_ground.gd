class_name OnGround
extends Motion


func _handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump" + _player.input_suffix):
		emit_signal("finished", "jump")
	._handle_input(event)


func _physics_update(_delta: float) -> void:
	if not _player.is_on_floor():
		emit_signal("finished", "fall")
