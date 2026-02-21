extends CharacterBody2D

@export var movespeed: float = 100
@export var jumpforce: float = -300
@onready var hud: CanvasLayer = $HUD
@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D
var jump = 1
var score: int:
	set(new_value):
		score = new_value
		hud.set_score_text(score)

func _physics_process(delta: float) -> void:
	var dir = Input.get_axis("left", "right")
	if dir != 0:
		anim_sprite.flip_h = dir < 0
	if not is_on_floor():
		anim_sprite.play("jump")
		velocity += get_gravity() * delta
	else:
		jump = 1
		if dir == 0:
			anim_sprite.play("idle")
		else:
			anim_sprite.play("run")
	velocity.x = dir * movespeed
	if jump == 1 and Input.is_action_just_pressed("jump"):
		if not is_on_floor():
			jump = 0
		velocity.y = jumpforce

	move_and_slide()
