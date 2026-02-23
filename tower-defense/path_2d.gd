extends Path2D

@export var enemy_scene: PackedScene
@export var spawn_interval: float = 1.0

var timer: float = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer += delta
	if timer >= spawn_interval:
		spawn_enemy()
		timer = 0.0

func spawn_enemy():
	if enemy_scene:
		var new_enemy = enemy_scene.instantiate()
		add_child(new_enemy)
