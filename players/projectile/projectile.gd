class_name Projectile
extends Area2D


export var speed := 1000.0

var direction: Vector2


func _ready() -> void:
	set_as_toplevel(true)


func _physics_process(delta: float) -> void:
	var velocity = direction * speed * delta
	position += velocity


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
