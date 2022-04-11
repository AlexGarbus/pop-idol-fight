extends Node

onready var _player1 := $Player1
onready var _player2 := $Player2
onready var _hud := $OverlayLayer/HUD
onready var _countdown := $OverlayLayer/Countdown
onready var _winner_display := $OverlayLayer/WinnerDisplay
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
		
		_winner_display.visible = true
		if _player1.health == 0:
			_winner_display.set_winner(_player2)
		else:
			_winner_display.set_winner(_player1)


func _on_DeathTimer_timeout() -> void:
	get_tree().reload_current_scene()
