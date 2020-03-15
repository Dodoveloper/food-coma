extends Area2D

var velocity : float
var direction : float
var hitpoints : int = 1

func setVelocity(Velocity : float):
	velocity = Velocity

func setDirection(Direction : float):
	direction = Direction

func setPosition(Pos : Vector2):
	position = Pos

func _physics_process(delta):
	var movement : Vector2
	movement = polar2cartesian(velocity, direction)
	position += movement * delta

func destroy():
	set_deferred("monitoring", false)
	set_deferred("monitorable", false)
	queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
