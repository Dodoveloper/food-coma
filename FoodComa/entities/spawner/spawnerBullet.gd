extends Node2D

export (PackedScene) var Bullet

var deltaTime : float
var spawnerTimer : float = 1.0
var quantitySpawner : float = 4.0
var boss
var velocityBullet : int = 200

func _process(d):
	spawn(d)

func spawn(d):
	deltaTime += d
	if deltaTime > spawnerTimer:
		for i in range(quantitySpawner):
			var bullet = Bullet.instance()
			bullet.scale = Vector2(4, 4)
			bullet.global_position = get_parent().global_position
			bullet.setVelocity(velocityBullet)
			bullet.setDirection(sin((deltaTime/spawnerTimer) + (0.5*PI*i)))
			get_parent().get_parent().add_child(bullet)
		deltaTime = 0.0
