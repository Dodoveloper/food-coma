extends HBoxContainer


export var hitpoint_scene : PackedScene
var life 

func initialize(life_point):
	life = life_point
	for i in life_point:
		var hitpoint = hitpoint_scene.instance()
		add_child(hitpoint)
	
func update_life(points):
	life -= points
	for i in points:
		remove_child(get_child(get_child_count()-1))
