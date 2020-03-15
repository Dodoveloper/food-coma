extends KinematicBody2D

export var enemy_name: String
export var life_points: int = 100

onready var life = life_points

signal got_hit

func hurt(quantity):
	life -= quantity
	emit_signal("got_hit", quantity)
	
