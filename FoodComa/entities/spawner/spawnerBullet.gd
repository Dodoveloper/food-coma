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
		if get_parent().life == 5:
			numberBullet = choose([1,5])
			path = choose([0.5*PI,PI]) * deltaTime
		elif get_parent().life == 4:
			numberBullet = choose([5,10])
			path = choose([PI,2*PI]) * deltaTime
		elif get_parent().life == 3:
			numberBullet = choose([10,20])
			path = choose([2*PI,4*PI]) * deltaTime
		elif get_parent().life == 2:
			numberBullet = choose([15,30])
			path = choose([4*PI,6*PI]) * deltaTime
		elif get_parent().life == 1:
			numberBullet = choose([5,10,30])
			velocityBullet = choose([400,200])
			spawnerTimer = choose([1500,3000])
#		path = choose([PI,2*PI,3*PI,5*PI,6*PI,7*PI,8*PI]) * deltaTime
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
