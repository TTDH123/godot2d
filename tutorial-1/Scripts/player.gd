extends Area2D

var speed = 200

func _process(delta: float) -> void:
	var dir = Input.get_axis("ui_left", "ui_right")
	position.x += dir * speed * delta
