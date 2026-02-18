extends Node2D

@export var fireball_scene: PackedScene

func _on_timer_timeout() -> void:
	var fireball1 = fireball_scene.instantiate()
	var fireball2 = fireball_scene.instantiate()
	fireball1.position = Vector2(randf_range(-150,150),-200)
	add_child(fireball1)
	fireball2.position = Vector2(randf_range(-150,150),-200)
	add_child(fireball2)
	
