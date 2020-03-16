extends ColorRect

onready var tween = $Tween

signal next

func move_player_to_center(player):
	call_deferred("add_child", player)
	tween.interpolate_property(player, "position", player.position, Vector2(600, 500), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)


func _ready():
	$AnimationPlayer.play("Appear")
	tween.start()
	


func _on_RETRY_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_QUIT_pressed():
	get_tree().paused = false
	get_tree().quit()


func _on_AnimationPlayer_animation_finished(anim_name):
	$Control/FIRST.grab_focus()


func _on_NEXT_pressed():
	get_tree().paused = false
	emit_signal("next")


