extends KinematicBody2D

export var speed : int = 500

var direction : Vector2 = Vector2()
var velocity : Vector2 = Vector2()

func _physics_process(delta):
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	velocity = direction.normalized() * speed * delta
	move_and_collide(velocity)
