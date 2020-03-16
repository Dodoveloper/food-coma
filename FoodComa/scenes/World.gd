extends Node2D

onready var boss_hud = $CanvasLayer/LifeBar
onready var player_hud = $CanvasLayer/Brioschis
onready var player = $Player
onready var boss = $Boss

func _ready():
	player_hud.initialize(player.lives)
	boss_hud.initialize(boss.enemy_name, boss.life)
	boss.initboss(self, player)

func _on_Player_hurt(hitpoints):
	player_hud.update_lives(hitpoints)

func _on_Player_fattened(lives):
	player_hud.initialize(lives)

func _on_Boss_got_hit(quantity):
	boss_hud.hurt(quantity)
