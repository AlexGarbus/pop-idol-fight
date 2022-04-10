extends Node

onready var _player1 := $Player1
onready var _player2 := $Player2
onready var _hud := $HUD
onready var _countdown := $Countdown


func _ready() -> void:
	get_tree().paused = true
	_hud.initialize(_player1, _player2)


func _on_Instructions_hidden() -> void:
	_countdown.play()


func _on_Countdown_finished() -> void:
	get_tree().paused = false
