extends KinematicBody2D

signal got_hit
signal dead

export var enemy_name: String
export var life_points: int = 100

onready var life = life_points


func initboss(root:Node, player:Node):
	$CarbonaraSpawner.initspawner(root, player, 4.0)
	return

func hurt(quantity):
	if not life > 0:
		$animator.play("death")
		emit_signal("dead")
	else:
		life -= quantity
		emit_signal("got_hit", quantity)

func _on_animator_animation_finished():
	if $animator.animation == "death":
		emit_signal("dead")
		# cambia scena
