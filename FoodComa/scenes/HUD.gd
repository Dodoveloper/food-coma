extends Control


export var lives: int = 3 setget set_lives

onready var label = $Label

func set_lives(value):
	lives = value
	if is_inside_tree():
		yield(self, "ready")
	label.text = str(lives)

func _ready():
	label.text = str(lives)
	
	
func update_lives(hitpoints):
	self.lives -= hitpoints
	
