extends Control

signal skip
signal over

var num_round = 0
onready var actor = $NinePatchRect/Actor
onready var text = $NinePatchRect/Text
onready var effect_text = $NinePatchRect/BBCODE
onready var cloud = $NinePatchRect
onready var anim = $AnimationPlayer

func _ready():
	num_round = global.course
	yield(get_tree().create_timer(1), "timeout")
	anim.play("ready")
	yield(anim, "animation_finished")
	speak()
	cloud.visible = true
	
var dialogues = [
	[
	{"actor": "nonna",
	"text" :"Hi, sweetheart! Are you hungry?"},
	{"actor":"nipote",
	"text":"Oh, not so much actually."},
	{"actor":"nonna",
	"text": "What do you mean? You look so wasted..."},
	{"actor":"nonna",
	"text": "Come on..."},
	{"actor":"nonna",
	"text": "[center][shake rate=10 level=10] YOU CAN EAT IT WITHOUT BREAD[/shake][/center]",
	"effect": true} 
	],
	[ {"actor":"nonna", "text":"Well done, my dear! Come on, take some of this! I made it just for you!"},
	{"actor":"nipote", "text": "Nonna, I'm full..."},
	{"actor":"nonna", "text": "What am I supposed to do with it?"},
	{"actor": "nonna", "text": "[center][shake rate=10 level=10]Throw it away? There you go, before it chills...[/shake][/center]", "effect":true}
	],
	[
	{"actor":"nonna", "text": "Oh sweetie, do you want some dessert?"},
	{"actor":"nipote", "text": "No, no, NONNA!"},
	{"actor":"nonna", "text": "R E L E A S E  T H E  K R A P F E N"}
	]
]

func _input(event):
	if event.is_action_pressed("ui_accept"):
		emit_signal("skip")

func speak():
	var this_round = dialogues[num_round]
	for this_actor in this_round:
		get_node(this_actor["actor"]).visible = true
		actor.text = this_actor["actor"]
		
		if "effect" in this_actor:
			effect_text.bbcode_enabled = true
			effect_text.bbcode_text = this_actor["text"]
			text.text = ""
		else:
			text.text = this_actor["text"]
			
		get_node(this_actor["actor"]).scale += Vector2(0.5,0.5)
		yield(self, "skip")
		get_node(this_actor["actor"]).scale -= Vector2(0.5,0.5)
		get_node(this_actor["actor"]).visible = false
	
	global.combat()
