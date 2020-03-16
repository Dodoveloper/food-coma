extends Node2D

onready var boss_hud = $CanvasLayer/LifeBar
onready var player_hud = $CanvasLayer/Brioschis
onready var player = $Player
onready var canvas_layer = $CanvasLayer
onready var boss = $Boss

export var gameover_scene : PackedScene
export var you_won_scene: PackedScene
export var next_course: PackedScene

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

func _on_Player_dead():
	var gameover = gameover_scene.instance()
	call_deferred("remove_child", player)
	canvas_layer.add_child(gameover)
	gameover.move_player_to_center(player)
	
	get_tree().paused = true

func _on_Boss_dead():
	var you_won = you_won_scene.instance()
	you_won.connect("next", self, "_on_next_course")
	canvas_layer.add_child(you_won)
	get_tree().paused = true

func _on_next_course():
	get_tree().change_scene_to(next_course)
