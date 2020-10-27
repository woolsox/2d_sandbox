extends StaticBody2D

var clicks_left = 3

func _input_event(viewport, event, shape_idx):
	if event.is_action_pressed('click') and clicks_left > 0:
		clicks_left -= 1
		print("click! clicks remaining: ", clicks_left)
	elif event.is_action_pressed('click') and clicks_left == 0:
		print("depleted!")
		$Sprite.texture = load("res://gold.png")
