extends KinematicBody2D

export (int) var speed = 200

var target = Vector2(self.position)
var velocity = Vector2()

func _ready():
	print("player position: ", self.position)
	print("player target: ", target)

func _input(event):
	if event.is_action_pressed('click'):
		target = get_global_mouse_position()
		_direction()
		
func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	# look_at(target)
	if position.distance_to(target) > 5:
		velocity = move_and_slide(velocity)

func _direction():
	if target.x < self.position.x:
		$AnimatedSprite.flip_h = true
	if target.x > self.position.x:
		$AnimatedSprite.flip_h = false
