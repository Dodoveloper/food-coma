extends KinematicBody2D

signal got_hit

export var enemy_name: String
export var life_points: int = 100
export var speed: int = 50

onready var life = life_points
onready var follow = $Node/Path2D/PathFollow2D

func initboss(root:Node, player:Node):
	$SpawnerBullet.initspawner(root, player, 4.0)
	return

func hurt(quantity):
	if not life > 0:
		$animator.play("death")
	else:
		life -= quantity
		emit_signal("got_hit", quantity)

func _physics_process(delta):
	follow.offset += speed * delta
	global_position = follow.global_position

func _on_animator_animation_finished():
	if $animator.animation == "death":
		queue_free()
		# cambia scena
