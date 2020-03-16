extends Node2D
class_name SpawnerEngine

export (PackedScene) var Bullet

#var spawnerTimer : float = 1500
#var velocityBullet : int = 200
#var path : float
#var counter = 0
# onready var diagonalTexture = preload("res://assets/level1/CarbonaraBullets/guanciale_diagonal.png")
# onready var normalTexture = preload("res://assets/level1/CarbonaraBullets/guanciale_vertical.png")
var RootNode:Node
var ParentNode:Node
var PlayerNode:Node
var MaxLife:int
var BulletScale:float

#var numberBullet = 10

func _ready():
	RootNode = null
	ParentNode = null
	PlayerNode = null
	MaxLife = 0
	BulletScale = 1.0
#	randomize()

func initspawner(root:Node, player:Node, bullet_scale:float):
	assert(null != root)
	assert(null != player)
	RootNode = root
	PlayerNode = player
	ParentNode = get_parent()
	assert(null != ParentNode)
	MaxLife = ParentNode.life
	BulletScale = bullet_scale
	return

func SpawnPatternsA(delta:float):
	pass

func SpawnPatternsB(delta:float):
	pass

func SpawnPatternsC(delta:float):
	pass

func SpawnPatternsD(delta:float):
	pass

func SpawnPatternsE(delta:float):
	pass

func SpawnBullets(bullets:Array):
	var bullet:Node
	var Parent:Node
	var Root:Node
	var params:Vector2
	
	if (null == Parent):
		return
	for i in range(bullets.size()):
		params = bullets[i]
		bullet = Bullet.instance()
		bullet.scale = Vector2(BulletScale, BulletScale)
		bullet.global_position = ParentNode.global_position
		bullet.setVelocity(params.x)
		bullet.setDirection(params.y)
		RootNode.add_child(bullet)

func _process(delta:float):
	var N:Node
	var currlife:int
	
	currlife = ParentNode.life
	if (currlife < 1):
		return
	match (currlife * 5) / MaxLife:
		0: SpawnPatternsA(delta)
		1: SpawnPatternsB(delta)
		2: SpawnPatternsC(delta)
		3: SpawnPatternsD(delta)
		_: SpawnPatternsE(delta)
	return


#	counter += 1
#	if counter > spawnerTimer*delta:
#		counter = 0
#		if get_parent().life == 5:
#			numberBullet = choose([1,5])
#			path = choose([0.5*PI,PI]) * deltaTime
#		elif get_parent().life == 4:
#			numberBullet = choose([5,10])
#			path = choose([PI,2*PI]) * deltaTime
#		elif get_parent().life == 3:
#			numberBullet = choose([10,20])
#			path = choose([2*PI,4*PI]) * deltaTime
#		elif get_parent().life == 2:
#			numberBullet = choose([15,30])
#			path = choose([4*PI,6*PI]) * deltaTime
#		elif get_parent().life == 1:
#			numberBullet = choose([5,10,30])
#			velocityBullet = choose([400,200])
#			spawnerTimer = choose([1500,3000])
##		path = choose([PI,2*PI,3*PI,5*PI,6*PI,7*PI,8*PI]) * deltaTime
#		pattern()
#list of possible pattern
# (i*PI) +i
# (2 * i * PI) + i



#func choose(array):
#	array.shuffle()
#	return array.front()

#func pattern():
#	for i in range(numberBullet):
#		var bullet = Bullet.instance()
#		bullet.scale = Vector2(4, 4)
#		bullet.global_position = get_parent().global_position
#		bullet.setVelocity(velocityBullet)
#		bullet.setDirection(path +i)
#		get_parent().get_parent().add_child(bullet)
