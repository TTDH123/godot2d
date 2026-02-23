extends PathFollow2D

@export var speed = 100
@export var health = 10


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress += speed * delta
	
	if progress_ratio >= 1.0:
		print("목표에 도달")
		queue_free()
	
func take_damage(amount):
	health -= amount
	if health <= 0:
		queue_free()
