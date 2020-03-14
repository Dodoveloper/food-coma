extends KinematicBody2D

export var life : int = 5
onready var hitpoints_container = $LifeBar/Control/HitPointContainer

func _ready():
	hitpoints_container.initialize(life)
func hurt(hitpoints):
	life -= hitpoints
	hitpoints_container.update_life(hitpoints)
	
