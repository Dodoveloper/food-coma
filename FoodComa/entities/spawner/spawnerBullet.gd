extends Node2D

var deltaTime : float
var spawnerTimer : float = 1.0
var quantitySpawner : float = 4.0
var boss
var velocityBullet : float = 0.001


func _process(d):
	spawn(d)

func spawn(d):
	deltaTime += d
	if deltaTime > spawnerTimer:
		for i in range(quantitySpawner):
			var bullet = Bullet.new()
			bullet.scale = Vector2(4,4)
			bullet.global_position = get_parent().global_position
			bullet.setVelocity(velocityBullet)
			bullet.setDireciton(sin((deltaTime/spawnerTimer) + (0.5*PI*i)))
			get_parent().add_child(bullet)
		deltaTime = 0.0
