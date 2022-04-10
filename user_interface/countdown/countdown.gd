extends Control


signal finished

export var count := 3
export var autostart := false
export var finish_message := "GO!"

onready var _label := $Label
onready var _count_timer := $CountTimer


func _ready() -> void:
	if autostart:
		play()
	else:
		visible = false


func play() -> void:
	visible = true
	_count_timer.start()
	
	for n in range(count, 0, -1):
		_label.text = str(n)
		yield(_count_timer, "timeout")
	
	_label.text = finish_message
	yield(_count_timer, "timeout")
	
	visible = false
	_count_timer.stop()
	emit_signal("finished")
