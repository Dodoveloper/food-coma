extends Area2D
class_name MeatballsBullet

var velocity : float
var direction : float
var hitpoints : int = 1

func _physics_process(delta):
	var movement : Vector2
	movement = polar2cartesian(velocity, direction)
	position += movement * delta

func setVelocity(Velocity : float):
	velocity = Velocity

func setDirection(Direction : float):
	direction = Direction
	while direction < 0.0:
		direction += 2*PI

func setPosition(Pos : Vector2):
	position = Pos

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func destroy():
	# WIP
	queue_free()
