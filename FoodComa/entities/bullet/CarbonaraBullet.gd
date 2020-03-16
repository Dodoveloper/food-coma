extends Area2D
class_name EnemyBullet

const HEXTANT_SIZE : float = 0.39269908169872415480783042290994
var velocity : float
var direction : float
var hitpoints : int = 1

func setVelocity(Velocity : float):
	velocity = Velocity

func setDirection(Direction : float):
	direction = Direction
	while direction < 0.0:
		direction += 2*PI

func setPosition(Pos : Vector2):
	position = Pos

func _physics_process(delta):
	var movement : Vector2
	var hextant : int
	var rotdeg : float
	var diagonal : bool

	# Obtain a value 0..15 determining which hextant the bullet flies into
	hextant = (floor(direction / HEXTANT_SIZE) as int) % 16
	assert((hextant >= 0) and (hextant <= 15))
	match hextant:
		0, 15: # East
			rotdeg = 90
			diagonal = false
		1,  2: # South-east
			rotdeg = 0
			diagonal = true
		3,  4: # South
			rotdeg = 0
			diagonal = false
		5,  6: # South-west
			rotdeg = -90
			diagonal = true
		7,  8: # West
			rotdeg = -90
			diagonal = false
		9, 10: # North-west
			rotdeg = -180
			diagonal = true
		11, 12: # North
			rotdeg = -180
			diagonal = false
		13, 14: # North-east
			rotdeg = -270
			diagonal = true
	
	movement = polar2cartesian(velocity, direction)
	position += movement * delta
	if diagonal:
		$Sprite.play("diagonal")
	else:
		$Sprite.play("vertical")
	$Sprite.rotation_degrees = rotdeg

func destroy():
	set_deferred("monitoring", false)
	set_deferred("monitorable", false)
	queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
