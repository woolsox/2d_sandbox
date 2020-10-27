extends StaticBody2D

const RESET_TIMER = 5

var clicks_left = 3
var time_start = 0

func _process(delta):
	_reset_rock(delta)

func _input_event(viewport, event, shape_idx):
	if event.is_action_pressed('click') and clicks_left > 0:
		clicks_left -= 1
		print("click! clicks remaining: ", clicks_left)
	elif event.is_action_pressed('click') and clicks_left == 0:
		print("depleted!")
		$Sprite.texture = load("res://Depleted.png")
		
func _reset_rock(delta):
	if clicks_left == 0:
		time_start += delta
		
		if time_start >= RESET_TIMER:
			time_start = 0
			clicks_left = 3
			$Sprite.texture = load("res://Rock.png")
