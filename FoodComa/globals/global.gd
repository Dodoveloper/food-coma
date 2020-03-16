extends Node

onready var course = 0
const MAX_COURSE = 2

var menu = ["res://scenes/World1.tscn", "res://scenes/World2.tscn"]
var meetup = "res://scenes/Dialogues.tscn"
var thanks = "res://scenes/Thanks.tscn"

func next_course():
	course += 1
	if course >= MAX_COURSE:
		print("THANKS FOR PLAYING")
		get_tree().change_scene(thanks)
		return
		
	
	get_tree().change_scene(meetup)

func start():
	get_tree().change_scene(meetup)
func combat():
	get_tree().change_scene(menu[course])

func _unhandled_key_input(event:InputEventKey):
	if event.is_action_pressed("ui_quit"):
		get_tree().quit()
