extends Node2D
class_name SpawnerEngine

export (PackedScene) var Bullet


var RootNode:Node
var ParentNode:Node
var PlayerNode:Node
var MaxLife:int
var BulletScale:float


func _ready():
	RootNode = null
	ParentNode = null
	PlayerNode = null
	MaxLife = 0
	BulletScale = 1.0

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

func _SpawnPatternsA(delta:float) -> Array:
	return [Vector2(delta, 0.0)]

func _SpawnPatternsB(delta:float) -> Array:
	return [Vector2(delta, 0.0)]

func _SpawnPatternsC(delta:float) -> Array:
	return [Vector2(delta, 0.0)]

func _SpawnPatternsD(delta:float) -> Array:
	return [Vector2(delta, 0.0)]

func _SpawnPatternsE(delta:float) -> Array:
	return [Vector2(delta, 0.0)]

func SpawnBullets(bullets:Array):
	var bullet:Node
	var params:Vector2
	
	for i in range(bullets.size()):
		params = bullets[i]
		bullet = Bullet.instance()
		bullet.scale = Vector2(BulletScale, BulletScale)
		bullet.global_position = ParentNode.global_position
		bullet.setVelocity(params.x)
		bullet.setDirection(params.y)
		if bullet.has_method("init_meatball_bullet"):
			bullet.init_meatball_bullet(RootNode, PlayerNode, 4.0)
		RootNode.add_child(bullet)

func _process(delta:float):
	var currlife:int
	var bullets:Array
	var state:int
	
	currlife = ParentNode.life
	if (currlife < 1):
		return
	state = floor((currlife as float * 5) / MaxLife as float) as int
	match state:
		0: bullets = _SpawnPatternsE(delta)
		1: bullets = _SpawnPatternsD(delta)
		2: bullets = _SpawnPatternsC(delta)
		3: bullets = _SpawnPatternsB(delta)
		_: bullets = _SpawnPatternsA(delta)
	SpawnBullets(bullets)
	return


var BulletSpiralOffset:float

func BulletSpiralSpawn(sweep:float, threads:int, speed:float) -> Array:
	var step:float
	var offset:float
	var B:Vector2 = Vector2(0.0, 0.0)
	var Result:Array = []
	
	Result.clear()
	step = PI / (threads as float / 2.0)
	offset = PI / threads
	BulletSpiralOffset += sweep
	for i in range(threads):
		B.x = speed
		B.y = (i * step) + offset + BulletSpiralOffset
		Result.append(B)
	return Result


func BulletThreadsSpawn(threads:int, speed:float) -> Array:
	var step:float
	var offset:float
	var B:Vector2 = Vector2(0.0, 0.0)
	var Result:Array = []
	
	Result.clear()
	step = PI / (threads as float / 2.0)
	offset = PI / threads
	for i in range(threads):
		B.x = speed
		B.y = (i * step) + offset
		Result.append(B)
	return Result

func BulletCircleSpawn(count:int, speed:float):
	var offset:float
	var PI2:float
	var B:Vector2 = Vector2(0.0, 0.0)
	var Result:Array = []
	
	offset = PI / count
	PI2 = 2 * PI
	for i in range(count):
		B.x = speed
		B.y = ((i * PI2) / count) + offset
		Result.append(B)
	return Result

func BulletFollowerSpawn(speed:float):
	var V:Vector2
	var B:Vector2 = Vector2(0.0, 0.0)
	var Result:Array = []
	
	V = PlayerNode.position - ParentNode.position
	V = V.normalized()
	B.x = speed
	B.y = cartesian2polar(V.x, V.y).y
	Result.append(B)
	return Result
