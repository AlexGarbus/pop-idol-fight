extends Control


onready var _health_display_p1 := $HealthDisplayP1
onready var _health_display_p2 := $HealthDisplayP2


func initialize(player1: Player, player2: Player) -> void:
	_health_display_p1.set_health(player1.health)
	player1.connect("health_changed", _health_display_p1, "set_health")
	_health_display_p2.set_health(player2.health)
	player2.connect("health_changed", _health_display_p2, "set_health")
