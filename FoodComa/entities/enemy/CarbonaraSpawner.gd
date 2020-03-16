extends SpawnerEngine


# ----- Configuration ----------------------------------------------------------
# Pattern A, wave A
const PATT_A_WAVE_A_BULLET_COUNT:int = 20
const PATT_A_WAVE_A_BULLET_FREQ:float = 0.5
const PATT_A_WAVE_A_BULLET_SPEED:float = 200.0
# Pattern A, wave B
const PATT_A_WAVE_B_BULLET_FREQ:float = 0.5
const PATT_A_WAVE_B_BULLET_SPEED:float = 150.0

onready var B:Vector2 = Vector2(0.0, 0.0)
onready var CarbonaraBullets:Array = []
onready var TimerA_WaveA:float = 0.0
onready var TimerA_WaveB:float = 0.0
onready var TimerB:float = 0.0
onready var TimerC:float = 0.0
onready var TimerD:float = 0.0
onready var TimerE:float = 0.0



func _SpawnPatternsA(delta:float) -> Array:
	var V:Vector2
	
	# Clear bullets array
	CarbonaraBullets.clear()
	# A circle of bullets each PATT_A_WAVE_A_BULLET_FREQ seconds
	TimerA_WaveA += delta
	if TimerA_WaveA >= PATT_A_WAVE_A_BULLET_FREQ:
		TimerA_WaveA = 0.0
		for i in range(PATT_A_WAVE_A_BULLET_COUNT):
			B.x = PATT_A_WAVE_A_BULLET_SPEED
			B.y = ((i * 2 * PI) / PATT_A_WAVE_A_BULLET_COUNT) + (PI / PATT_A_WAVE_A_BULLET_COUNT)
			CarbonaraBullets.append(B)
	# A bullet towards the player each PATT_A_WAVE_B_BULLET_FREQ seconds
	TimerA_WaveB += delta
	if TimerA_WaveB >= PATT_A_WAVE_B_BULLET_FREQ:
		TimerA_WaveB = 0.0
		V = PlayerNode.position - ParentNode.position
		V = V.normalized()
		B.x = PATT_A_WAVE_B_BULLET_SPEED
		B.y = cartesian2polar(V.x, V.y).y
		CarbonaraBullets.append(B)
	return CarbonaraBullets

func _SpawnPatternsB(delta:float) -> Array:
	# Clear bullets array
	CarbonaraBullets.clear()
	TimerB += delta
	return CarbonaraBullets

func _SpawnPatternsC(delta:float) -> Array:
	# Clear bullets array
	CarbonaraBullets.clear()
	TimerC += delta
	return CarbonaraBullets

func _SpawnPatternsD(delta:float) -> Array:
	# Clear bullets array
	CarbonaraBullets.clear()
	TimerD += delta
	return CarbonaraBullets

func _SpawnPatternsE(delta:float) -> Array:
	# Clear bullets array
	CarbonaraBullets.clear()
	TimerE += delta
	return CarbonaraBullets
