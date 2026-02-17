extends CharacterBody2D


const SPEED = 300.0
const BOOST_SPEED = 500.0
const BOOST_USED = 100.0
const BOOST_REGAIN = 50.0

var boost_gage = 100
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_x := Input.get_axis("move_left", "move_right")
	var direction_y := Input.get_axis("move_up", "move_down")
	
	var is_boost := Input.is_action_pressed("boost")
	var speed = SPEED
	
	# boost_gage > 0일때 가속 가능, boost 버튼을 떼면 boost_gage가 자동회복
	if is_boost:
		if boost_gage > 0:
			animated_sprite.play("run")
			speed = BOOST_SPEED
			boost_gage -= delta * BOOST_USED
		else: animated_sprite.play("walk")
		
	else:
		animated_sprite.play("walk")
		if boost_gage <= 100:
			boost_gage += delta * BOOST_REGAIN
	print(boost_gage)
	
	# 상하좌우 이동
	if direction_x:
		velocity.x = direction_x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	if direction_y:
		velocity.y = direction_y * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)

	move_and_slide()
