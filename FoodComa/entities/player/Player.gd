extends KinematicBody2D

signal hurt
signal collect

export var speed : int = 500
export var lives : int = 3

var direction : Vector2 = Vector2()
var velocity : Vector2 = Vector2()

var cur_state : String = "idle"
var body_shapes = ["thin", "medium", "overweight"]
var cur_shape : int = 0
var is_shooting : bool = false

func _ready():
	set_animation(cur_state, is_shooting, body_shapes[cur_shape])

func _physics_process(_delta):
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	velocity = direction.normalized() * speed
	velocity = move_and_slide(velocity)
	
	$AnimSprite.flip_h = false if get_global_mouse_position().x - global_position.x >= 0 \
			else true
	cur_state = "run" if direction.length() > 0 else "idle"
	is_shooting = Input.is_action_pressed("ui_click")
	set_animation(cur_state, is_shooting, body_shapes[cur_shape])

func set_animation(state : String, is_shooting : bool, body_shape : String):
	var new_anim = "%s_%s%s" % [state, "throw_antiacid_" if is_shooting else "", body_shape]
	$AnimSprite.play(new_anim)
	
func get_fatter():
	cur_shape += 1
	if cur_shape >= body_shapes.size():
		# game over
		pass

func _on_Area2D_area_entered(area):
	if area is Bullet:
		lives -= area.hitpoints if lives > 0 else 0
		area.destroy()
		emit_signal("hurt", lives)
	if area is Powerup:
		emit_signal("collect", area)
