extends Node2D

export (PackedScene) var Bullet

var deltaTime : float = 0.0
var spawnerTimer : float = 1500
var velocityBullet : int = 200
var path : float
var counter = 0
onready var diagonalTexture = preload("res://assets/level1/CarbonaraBullets/guanciale_diagonal.png")
onready var normalTexture = preload("res://assets/level1/CarbonaraBullets/guanciale_vertical.png")

var numberBullet = 10

func _ready():
	randomize()

func _process(d):
	deltaTime += d
	counter += 1
	if counter > spawnerTimer*d:
		counter = 0
		numberBullet = 5
		path = choose([PI,2*PI,3*PI,5*PI,6*PI,7*PI,8*PI]) * deltaTime
		pattern()
#list of possible pattern
# (i*PI) +i
# (2 * i * PI) + i
func choose(array):
	array.shuffle()
	return array.front()

func pattern():
	for i in range(numberBullet):
		var bullet = Bullet.instance()
		bullet.scale = Vector2(4, 4)
		bullet.global_position = get_parent().global_position
		bullet.setVelocity(velocityBullet)
		bullet.setDirection(path +i)
		get_parent().get_parent().add_child(bullet)
