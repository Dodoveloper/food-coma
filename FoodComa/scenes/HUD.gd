extends Control


export var life_scene : PackedScene
onready var label = $Label
const OFFSET = 30

func initialize(lives):
	for i in lives:
		var life = life_scene.instance()
		add_child(life)
		life.position.x = OFFSET*i
	

func update_lives(_lives):
	remove_child(get_child(get_child_count()-1))
	
