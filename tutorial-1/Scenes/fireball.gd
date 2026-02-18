extends Area2D

var rng = RandomNumberGenerator.new()
var amp = rng.randf_range(10,30)
var max_x = 0
var min_x = 0
var trend = true
var temp = 0
var xspeed = 50
var speed = 0

func _ready():
	speed = rng.randf_range(100,150)
	max_x = position.x + amp
	min_x = position.x - amp
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(position.x, ' ', position.y)
	position.y += speed * delta
	if trend:
		position.x += xspeed * delta
	else:
		position.x -= xspeed * delta
		
	if position.x >= max_x:
		trend = false
	elif position.x <= min_x:
		trend = true


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		get_tree().reload_current_scene()
