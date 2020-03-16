extends SpawnerEngine


# ----- Configuration ----------------------------------------------------------
# Pattern A
const PATT_A_BULLET_FREQ:float = 1.8
const PATT_A_BULLET_SPEED:float = 200.0

# Pattern B
const PATT_B_BULLET_FREQ:float = 2.0
const PATT_B_BULLET_SPEED:float = 100.0

# Pattern C
const PATT_C_BULLET_FREQ:float = 2.0
const PATT_C_BULLET_THREADS:int = 2
const PATT_C_BULLET_SPEED:float = 100.0

# Pattern D
const PATT_D_BULLET_FREQ:float = 2.5
const PATT_D_BULLET_THREADS:int = 4
const PATT_D_BULLET_SPEED:float = 100.0

# Pattern E, wave A
const PATT_E_WAVE_A_BULLET_FREQ:float = 2.5
const PATT_E_WAVE_A_BULLET_THREADS:int = 4
const PATT_E_WAVE_A_BULLET_SPEED:float = 100.0
# Pattern E, wave B
const PATT_E_WAVE_B_BULLET_FREQ:float = 1.0
const PATT_E_WAVE_B_BULLET_SPEED:float = 400.0



# ----- Variables --------------------------------------------------------------
# Pattern A
onready var TimerA:float = 0.0
# Pattern B
onready var TimerB:float = 0.0
# Pattern C
onready var TimerC:float = 0.0
# Pattern D
onready var TimerD:float = 0.0
# Pattern E
onready var TimerE_WaveA:float = 0.0
onready var TimerE_WaveB:float = 0.0

# ----- Pattern spawners -------------------------------------------------------
func _SpawnPatternsA(delta:float) -> Array:
	var Wave:Array
	
	# Meatballs towards the player
	TimerA += delta
	if TimerA > PATT_A_BULLET_FREQ:
		TimerA = 0.0
		Wave = BulletFollowerSpawn(PATT_A_BULLET_SPEED)
	return Wave

func _SpawnPatternsB(delta:float) -> Array:
	var Wave:Array
	
	# Meatballs towards the player
	TimerB += delta
	if TimerB > PATT_B_BULLET_FREQ:
		TimerB = 0.0
		Wave = BulletFollowerSpawn(PATT_B_BULLET_SPEED)
	return Wave

func _SpawnPatternsC(delta:float) -> Array:
	var Wave:Array
	
	# Meatballs towards the edge of the screen
	TimerC += delta
	if TimerC > PATT_C_BULLET_FREQ:
		TimerC = 0.0
		Wave = BulletThreadsSpawn(PATT_C_BULLET_THREADS, PATT_C_BULLET_SPEED)
	return Wave

func _SpawnPatternsD(delta:float) -> Array:
	var Wave:Array
	
	# Meatballs towards the edge of the screen
	TimerD += delta
	if TimerD > PATT_D_BULLET_FREQ:
		TimerD = 0.0
		Wave = BulletThreadsSpawn(PATT_D_BULLET_THREADS, PATT_D_BULLET_SPEED)
	return Wave

func _SpawnPatternsE(delta:float) -> Array:
	var WaveA:Array
	var WaveB:Array
	
	# Meatballs towards the edge of the screen
	TimerE_WaveA += delta
	if TimerE_WaveA > PATT_E_WAVE_A_BULLET_FREQ:
		TimerE_WaveA = 0.0
		WaveA = BulletThreadsSpawn(PATT_E_WAVE_A_BULLET_THREADS, PATT_E_WAVE_A_BULLET_SPEED)
	TimerE_WaveB += delta
	if TimerE_WaveB > PATT_E_WAVE_B_BULLET_FREQ:
		TimerE_WaveB = 0.0
		WaveB = BulletFollowerSpawn(PATT_E_WAVE_B_BULLET_SPEED)
	return WaveA + WaveB











