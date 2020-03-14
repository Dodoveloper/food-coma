extends Node2D


onready var hud = $CanvasLayer/Brioschis
onready var player = $Player

func _ready():
	hud.initialize(player.lives)
	
func _on_Player_hurt(hitpoints):
	hud.update_lives(hitpoints)

