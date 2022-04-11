extends Control


onready var _label := $Label


func set_winner(player: Player) -> void:
	_label.text = _label.text % player.player_name
