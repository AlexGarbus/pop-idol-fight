extends Control


onready var _progress_bar := $VBoxContainer/ProgressBar


func set_health(value: int) -> void:
	_progress_bar.value = value
