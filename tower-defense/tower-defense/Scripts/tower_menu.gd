extends CanvasLayer

var current_tower = null

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("place_tower") and is_instance_valid(current_tower):
		var tower = current_tower.instantiate()
		get_tree().root.add_child(tower)
		tower.position = get_viewport().get_camera_2d().get_global_mouse_position()
		current_tower = null



func _on_button_pressed() -> void:
	if GoldManager.money >= 50 and not is_instance_valid(current_tower):
		current_tower = preload("uid://biukxvhgxh4y1")
		GoldManager.money -= 50
	
func _ready() -> void:
	$Money.text = str(GoldManager.money)
	GoldManager.money_changed.connect(money_update)
	
func money_update(new_money: int) -> void:
	$Money.text = str(new_money)
