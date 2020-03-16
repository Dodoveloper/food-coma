extends KinematicBody2D

signal got_hit
signal dead

export var enemy_name: String
export var life_points: int = 100
export var speed: int = 50

onready var life = life_points
onready var follow = $Node/Path2D/PathFollow2D

func initboss(root:Node, player:Node):
	var M:Material
	
	$SpawnerBullet.initspawner(root, player, 4.0)
	M = $animator.material
	if (null != M):
		M.set_shader_param("enable", false);
		M.set_shader_param("color", Vector3(0.5, 1.0, 1.0));
	return

func hurt(quantity):
	var M:Material
	
	if not life > 0:
		$animator.play("death")
		emit_signal("dead")
	else:
		life -= quantity
		emit_signal("got_hit", quantity)
	M = $animator.material
	if (null != M):
		M.set_shader_param("enable", true);
		yield(get_tree().create_timer(0.033), "timeout")
		M.set_shader_param("enable", false);

func _physics_process(delta):
	follow.offset += speed * delta
	global_position = follow.global_position

func _on_animator_animation_finished():
	if $animator.animation == "death":
		emit_signal("dead")
		# cambia scena
