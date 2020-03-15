extends Node2D

export var enemy_name: String
export var life_points: int = 100

onready var label = $Control/BossName
onready var container = $Control/HitPointContainer


func _ready():
	label.text = enemy_name
	container.initialize(life_points)

func hurt(quantity):
	container.update_life(quantity)
