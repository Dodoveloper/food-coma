extends KinematicBody2D

signal hurt
signal dead
signal collect

export var speed : int = 500
export var lives : int = 3
export var accuracy : float = 0.1
export var Bullet : PackedScene

var direction : Vector2 = Vector2()
var velocity : Vector2 = Vector2()

var cur_state : String = "idle"
var body_shapes = ["thin", "medium", "overweight", "obese"]
var cur_shape : int = 0
var is_shooting : bool = false
var screen : Rect2

func _ready():
	screen = get_viewport_rect()

func _physics_process(_delta):
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	velocity = direction.normalized() * speed
	velocity = move_and_slide(velocity)
	self.position.x = clamp(self.position.x, screen.position.x, screen.end.x)
	self.position.y = clamp(self.position.y, screen.position.y, screen.end.y)

	# animation
	cur_state = "run" if direction.length() > 0 else "idle"
	if Input.is_action_just_released("ui_select") and not is_shooting:
		shoot($ShootingPos.global_position)
	set_animation(cur_state, is_shooting, body_shapes[cur_shape])

func set_animation(state : String, shooting : bool, body_shape : String):
	var new_anim = "%s_%s%s" % [state, "throw_antiacid_" if shooting else "", body_shape]
	$AnimSprite.play(new_anim)

func shoot(start_pos : Vector2):
	is_shooting = true
	var bullet_dir = Vector2.UP.normalized()
	var b = Bullet.instance()
	get_parent().add_child(b)
	var rand = rand_range(-accuracy / 6, accuracy / 6)
	b.start(start_pos, bullet_dir, rand)
	$FireRate.start()

func _on_Area2D_area_entered(area):
	if area.is_in_group("enemy_bullet"):
		if not lives > 0:
			emit_signal("dead")
			set_physics_process(false)
			$AnimSprite.play("death")
			return
		take_damage(area.hitpoints)
		area.destroy()
	if area is Powerup:
		emit_signal("collect", area)

func take_damage(amount : int):
	# decrease life
	lives -= amount
	cur_shape += 1 if cur_shape < body_shapes.size() - 1 else 0
	emit_signal("hurt", lives)
	# hit animation
	$Area2D.set_deferred("monitorable", false)
	$Area2D.set_deferred("monitoring", false)
	$AnimSprite.modulate.g = 0.0
	yield(get_tree().create_timer(1.0), "timeout")
	$Area2D.set_deferred("monitorable", true)
	$Area2D.set_deferred("monitoring", true)
	$AnimSprite.modulate.g = 1.0

func _on_FireRate_timeout():
	is_shooting = false
