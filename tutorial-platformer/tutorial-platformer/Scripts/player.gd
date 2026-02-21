extends CharacterBody2D

@export var movespeed: float = 300
@export var jumpforce: float = -400
@onready var hud: CanvasLayer = $HUD

var score: int:
	set(new_value):
		score = new_value
		hud.set_score_text(score)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	var dir = Input.get_axis("left", "right")
	velocity.x = dir * movespeed
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jumpforce

	move_and_slide()
