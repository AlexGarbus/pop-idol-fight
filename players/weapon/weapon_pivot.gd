class_name WeaponPivot
extends Position2D


func _ready() -> void:
	owner.connect("direction_changed", self, "_on_Player_direction_changed")


func _on_Player_direction_changed(direction: Vector2):
	rotation = direction.angle()
