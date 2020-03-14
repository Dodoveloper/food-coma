extends KinematicBody2D

export var speed : int = 500
export var lives : int = 3


var direction : Vector2 = Vector2()
var velocity : Vector2 = Vector2()


signal hurt
signal collect

func _physics_process(delta):
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	velocity = direction.normalized() * speed
	velocity = move_and_slide(velocity)


func _on_Area2D_area_entered(area):
	if area is Bullet:
		lives -= area.hitpoints if lives > 0 else 0
		area.destroy()
		emit_signal("hurt", lives)
	if area is Powerup:
		emit_signal("collect", area)
