extends Area2D

export var speed : int
export var damage : int

var velocity : Vector2

func start(_position, _direction, _angle):
	global_position = _position
	rotation = _direction.angle() + _angle
	velocity = Vector2(1, 0).rotated(rotation) * speed

func _physics_process(delta):
	position += velocity * delta

func explode():
	queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
