extends CanvasLayer

@onready var container: HBoxContainer = $HBoxContainer

# Called when the node enters the scene tree for the first time.
func set_life(life):
	for node in container.get_children():
		node.hide()
	
	for i in life:
		container.get_child(i).show()
