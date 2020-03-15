extends Control


export var hitpoint_scene : PackedScene
var life 

func initialize(life_point):
	life = life_point
	for i in life_point:
		var hitpoint = hitpoint_scene.instance()
		add_child(hitpoint)
	
func update_life(points):
	var k:int
	var N:Node
	
	life -= points
	k = get_child_count() - 1
	for i in points:
		if (k >= 0):
			N = get_child(k)
			if null != N:
				remove_child(N)
			k -= 1
