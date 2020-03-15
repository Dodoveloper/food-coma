extends KinematicBody2D

export var life : int = 5
signal got_hit

func hurt(quantity):
	life -= quantity
	emit_signal("got_hit", quantity)
	
	
