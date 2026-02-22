extends Area2D
@export var speed = 100
@export var health: int = 3:
	set(value):
		health = value
		$HUD.set_life(health)
@export var team: StringName

@onready var basic_offset: Vector2 = $Hitbox.position

var is_attacking: bool = false

func take_damage(damage: int) -> void:
	health -= damage
	if health < 0:
		queue_free()
		get_tree().reload_current_scene()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var dir = Input.get_vector("left", "right", "up", "down")
	position += dir * speed * delta
	# 공격 중에는 애니메이션 및 히트박스 위치 고정
	if not is_attacking:
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
	
	if Input.is_action_just_pressed("attack"):
		attack()

func attack():
	is_attacking = true
	$AnimatedSprite2D.play("attack")
	$Hitbox.enable()
	await get_tree().create_timer(0.5).timeout
	$Hitbox.disable()
	is_attacking = false
	
