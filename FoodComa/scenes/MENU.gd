extends Control






func _on_Play_pressed():
	global.start()


func _on_Credits_pressed():
	get_tree().change_scene("res://scenes/Thanks.tscn")
