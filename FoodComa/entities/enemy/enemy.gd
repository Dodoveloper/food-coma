extends KinematicBody2D

signal got_hit

export var enemy_name: String
export var life_points: int = 100

onready var life = life_points

func hurt(quantity):
	if not life > 0:
		$animator.play("death")
	else:
		life -= quantity
		emit_signal("got_hit", quantity)

func _on_animator_animation_finished():
	if $animator.animation == "death":
		queue_free()
		# cambia scena
