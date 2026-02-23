extends Area2D

@export var bullet_scene: PackedScene
var can_shoot = true

var enemy_list = []


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		var enemy = area.get_parent()
		enemy_list.append(enemy)



func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		var enemy = area.get_parent()
		enemy_list.erase(enemy)

func _process(delta):
	if enemy_list.size() > 0:
		var current_target = enemy_list[0]
		
		if is_instance_valid(current_target):
			look_at(current_target.global_position)
			
			if can_shoot:
				shoot()
		else:
			enemy_list.erase(current_target)
			
func shoot():
	can_shoot = false
	var bullet = bullet_scene.instantiate()
	get_tree().root.add_child(bullet)
	bullet.global_position = global_position
	bullet.global_rotation = global_rotation
	$Timer.start()
	


func _on_timer_timeout() -> void:
	can_shoot = true
