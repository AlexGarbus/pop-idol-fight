extends Node

onready var _player1 := $Player1
onready var _player2 := $Player2
onready var _hud := $HUD
onready var _countdown := $Countdown
onready var _death_timer := $DeathTimer


func _ready() -> void:
	get_tree().paused = true
	_hud.initialize(_player1, _player2)
	_player1.connect("health_changed", self, "_on_Player_health_changed")
	_player2.connect("health_changed", self, "_on_Player_health_changed")


func _on_Instructions_hidden() -> void:
	_countdown.play()


func _on_Countdown_finished() -> void:
	get_tree().paused = false


func _on_Player_health_changed(health: int) -> void:
	if health == 0:
		_death_timer.start()


func _on_DeathTimer_timeout() -> void:
	get_tree().reload_current_scene()
