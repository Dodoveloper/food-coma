extends KinematicBody2D

export var life : int = 100

func hurt(hitpoints):
	life -= hitpoints
	
