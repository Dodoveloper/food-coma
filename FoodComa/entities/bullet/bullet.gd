extends KinematicBody2D
class_name Bullet

var velocity : float
var direction : float

func setVelocity(Velocity : float):
	velocity = Velocity

func setDireciton(Direction : float):
	direction = Direction

func setPosition(Pos : Vector2):
	position = Pos
	
func _physics_process(delta):
	var movement : Vector2
	movement = polar2cartesian(velocity,direction)
	move_and_collide(movement)
