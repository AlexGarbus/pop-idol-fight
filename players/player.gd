class_name Player
extends KinematicBody2D


signal attacked(attacker)
signal direction_changed(direction)
signal health_changed(health)

export var player_name := "Player"
export var input_suffix := "_p1"
export var max_health := 100
export var attack_damage := 5
export var start_direction := Vector2.RIGHT

var look_direction := Vector2.RIGHT setget set_look_direction
var health: int setget set_health
var fighting := true setget set_fighting

onready var _attack_detector := $AttackDetector
onready var _sprite := $SpritePivot/AnimatedSprite


func _ready() -> void:
	set_look_direction(start_direction)
	set_health(max_health)


func set_look_direction(value: Vector2) -> void:
	look_direction = value
	emit_signal("direction_changed", value)


func set_health(value: int) -> void:
	health = clamp(value, 0, max_health)
	emit_signal("health_changed", health)


func set_fighting(value: bool) -> void:
	set_process_input(value)
	_attack_detector.monitoring = value


func play_animation(value: String) -> void:
	_sprite.play(value)


func _on_AttackDetector_area_entered(area: Area2D) -> void:
	if not is_a_parent_of(area):
		set_health(health - attack_damage)
		emit_signal("attacked", area)
