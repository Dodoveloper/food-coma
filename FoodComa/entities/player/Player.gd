extends KinematicBody2D

export var speed : int = 500

var direction : Vector2 = Vector2()
var velocity : Vector2 = Vector2()

func _physics_process(delta):
	direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	direction.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	
	velocity = direction.normalized() * speed * delta
	move_and_collide(velocity)
