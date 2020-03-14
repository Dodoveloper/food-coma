extends Node2D

export (PackedScene) var Bullet

var deltaTime : float = 0.0
var spawnerTimer : float = 1000
var velocityBullet : int = 200
var delta : float
var pattern : float
var counter = 0

func _ready():
	randomize()

func _process(d):
	deltaTime += d
	counter += 1
	if counter > spawnerTimer*d:
		counter = 0
		pattern = 0.5 + (3-0.5) * deltaTime
		spawn()

func spawn():
#	if deltaTime > spawnerTimer:
	var bullet = Bullet.instance()
	bullet.scale = Vector2(4, 4)
	bullet.global_position = get_parent().global_position
	bullet.setVelocity(velocityBullet)
	bullet.setDirection(pattern)
	get_parent().get_parent().add_child(bullet)
#		deltaTime = 0.0
