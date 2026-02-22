extends Area2D

@export var health: int = 3
@export var team: StringName
@export var speed: int = 50

@onready var player = get_tree().get_first_node_in_group("player")
@onready var basic_offset: Vector2 = $Hitbox.position

func _ready() -> void:
	await get_tree().process_frame
	
func take_damage(damage: int) -> void:
	health -= damage
	if health <= 0:
		queue_free()


var is_attacking: bool = false

func attack() -> void:
	is_attacking = true
	$AnimatedSprite2D.play("idle")
	await get_tree().create_timer(0.4).timeout
	$AnimatedSprite2D.play("attack")
	$Hitbox.enable()
	await get_tree().create_timer(0.35).timeout
	$Hitbox.disable()
	is_attacking = false

func _process(delta: float) -> void:
	if not is_attacking:
		var dir := position.direction_to(player.position)
		position += dir * speed * delta
		if dir.x < 0:
			$AnimatedSprite2D.flip_h = true
			$Hitbox.position = Vector2(-basic_offset.x, basic_offset.y)
		elif dir.x > 0:
			$AnimatedSprite2D.flip_h = false
			$Hitbox.position = basic_offset
		
		if dir != Vector2.ZERO:
			$AnimatedSprite2D.play("move")
		else:
			$AnimatedSprite2D.play("idle")
		
		if position.distance_to(player.position) <= 20:
			attack()
