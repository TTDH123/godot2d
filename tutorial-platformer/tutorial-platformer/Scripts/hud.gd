extends CanvasLayer

# 씬 탭에서 Label 노드를 Ctrl을 누르고 드래그하여 만들 수 있다
@onready var label: Label = $Label

func set_score_text(score):
	label.text = "점수: " + str(score)
