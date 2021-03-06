extends Area2D
class_name PlayerBullet

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
	velocity = Vector2(0.0, 0.0)
	$Sprite.rotation_degrees = 0
	self.rotation_degrees = 0

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_PlayerBullet_body_entered(body):
	if body.is_in_group("boss"):
		body.hurt(1)
		explode()

func _on_Sprite_animation_finished():
	if $Sprite.animation == "exploding":
		queue_free()
