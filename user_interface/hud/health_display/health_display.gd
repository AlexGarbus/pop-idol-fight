extends Control


onready var _progress_bar := $VBoxContainer/ProgressBar
onready var _name_label := $VBoxContainer/Label


func set_name(value: String) -> void:
	_name_label.text = value


func set_health(value: int) -> void:
	_progress_bar.value = value
