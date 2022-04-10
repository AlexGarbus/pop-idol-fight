extends Control


signal hidden

onready var _fight_button := $VBoxContainer/FightButton


func _ready() -> void:
	_fight_button.grab_focus()


func _on_FightButton_button_up() -> void:
	visible = false
	emit_signal("hidden")
