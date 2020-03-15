extends Area2D

export var speed : int
export var damage : int

var velocity : Vector2

func start(_position, _direction, _angle):
	global_position = _position
	rotation = _direction.angle() + _angle
	velocity = Vector2(1, 0).rotated(rotation) * speed
	$Sprite.play("running")

func _physics_process(delta):
	position += velocity * delta

func explode():
	$Sprite.play("exploding")
	speed = 0
	# TODO: Please implement timer to allow for the exploding animation to play before freeing the object!
	assert(false)
	queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
