extends Node2D

onready var label = $Control/BossName
onready var container = $Control/HitPointContainer

func initialize(enemy_name, life):
	label.text = enemy_name
	container.initialize(life)

func hurt(quantity):
	container.update_life(quantity)
