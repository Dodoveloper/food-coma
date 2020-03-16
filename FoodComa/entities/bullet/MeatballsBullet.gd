extends Area2D
class_name MeatballsBullet

export var speed : int
export var hitpoints : int = 1

var velocity : Vector2

func start(_position, _direction, _angle):
	global_position = _position
	rotation = _direction.angle() + _angle
	velocity = Vector2.RIGHT.rotated(rotation) * speed

func _physics_process(delta):
	position += velocity * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
