extends KinematicBody2D

signal hurt
signal collect

export var speed : int = 500
export var lives : int = 3
export var accuracy : float = 0.1
export var Bullet : PackedScene

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

	# animation
	$AnimSprite.flip_h = false if get_global_mouse_position().x - global_position.x >= 0 \
			else true
	cur_state = "run" if direction.length() > 0 else "idle"
	if Input.is_action_just_released("ui_click"):
		shoot(get_global_mouse_position())
	set_animation(cur_state, is_shooting, body_shapes[cur_shape])

func set_animation(state : String, shooting : bool, body_shape : String):
	var new_anim = "%s_%s%s" % [state, "throw_antiacid_" if shooting else "", body_shape]
	$AnimSprite.play(new_anim)

func get_fatter():
	# to be changed
	cur_shape += 1 if cur_shape >= body_shapes.size() else 0
	if cur_shape >= body_shapes.size():
		# game over
		pass

func shoot(target_pos : Vector2):
	is_shooting = true
	var bullet_dir = (target_pos - $ShootingPos.global_position).normalized()
	var b = Bullet.instance()
	get_parent().add_child(b)
	var rand = rand_range(-accuracy / 6, accuracy / 6)
	b.start($ShootingPos.global_position, bullet_dir, rand)
	yield(get_tree().create_timer(0.4), "timeout")
	is_shooting = false

func _on_Area2D_area_entered(area):
	if "EnemyBullet" in area.name:
		if lives > 0:
			lives -= area.hitpoints
		else:
			get_fatter()
		area.destroy()
		emit_signal("hurt", lives)
	if area is Powerup:
		emit_signal("collect", area)
