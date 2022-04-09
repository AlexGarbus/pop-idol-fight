extends Node

onready var _player1 := $Player1
onready var _player2 := $Player2
onready var _hud := $HUD


func _ready() -> void:
	_hud.initialize(_player1, _player2)
