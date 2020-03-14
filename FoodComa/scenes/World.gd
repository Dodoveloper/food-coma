extends Node2D


onready var hud = $CanvasLayer/Brioschis


func _on_Player_hurt(hitpoints):
	hud.update_lives(hitpoints)
