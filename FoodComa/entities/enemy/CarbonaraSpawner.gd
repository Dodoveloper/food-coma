extends SpawnerEngine


# ----- Configuration ----------------------------------------------------------
# Pattern A, wave A
const PATT_A_WAVE_A_BULLET_FREQ:float = 0.5
const PATT_A_WAVE_A_BULLET_SPEED:float = 300.0
const PATT_A_WAVE_A_BULLET_THREADS:int = 4
const PATT_A_WAVE_A_SWEEP_SPEED:float = 0.2
# Pattern A, wave B
const PATT_A_WAVE_B_BULLET_FREQ:float = 0.25
const PATT_A_WAVE_B_BULLET_SPEED:float = 400.0
const PATT_A_WAVE_B_BULLET_THREADS:int = 4

# Pattern B, wave A
const PATT_B_WAVE_A_BULLET_FREQ:float = 0.25
const PATT_B_WAVE_A_BULLET_SPEED:float = 300.0
const PATT_B_WAVE_A_BULLET_THREADS:int = 8
const PATT_B_WAVE_A_SWEEP_SPEED:float = 0.1
# Pattern B, wave B
const PATT_B_WAVE_B_BULLET_FREQ:float = 0.12
const PATT_B_WAVE_B_BULLET_SPEED:float = 400.0
const PATT_B_WAVE_B_BULLET_THREADS:int = 4

# Pattern C, wave A
const PATT_C_WAVE_A_BULLET_COUNT:int = 20
const PATT_C_WAVE_A_BULLET_FREQ:float = 0.5
const PATT_C_WAVE_A_BULLET_SPEED:float = 200.0
# Pattern C, wave B
const PATT_C_WAVE_B_BULLET_FREQ:float = 0.5
const PATT_C_WAVE_B_BULLET_SPEED:float = 150.0

# Pattern D, wave A
const PATT_D_WAVE_A_BULLET_COUNT:int = 20
const PATT_D_WAVE_A_BULLET_FREQ:float = 0.25
const PATT_D_WAVE_A_BULLET_SPEED:float = 300.0
# Pattern D, wave B
const PATT_D_WAVE_B_BULLET_FREQ:float = 0.75
const PATT_D_WAVE_B_BULLET_SPEED:float = 75.0

# Pattern E, wave A
const PATT_E_WAVE_A_BULLET_FREQ:float = 0.05
const PATT_E_WAVE_A_BULLET_SPEED:float = 300.0
const PATT_E_WAVE_A_BULLET_THREADS:int = 6
const PATT_E_WAVE_A_SWEEP_SPEED:float = 0.2
# Pattern E, wave B
const PATT_E_WAVE_B_BULLET_FREQ:float = 0.5
const PATT_E_WAVE_B_BULLET_SPEED:float = 700.0


# ----- Variables --------------------------------------------------------------
# Pattern A
onready var TimerA_WaveA:float = 0.0
onready var TimerA_WaveB:float = 0.0

# Pattern B
onready var TimerB_WaveA:float = 0.0
onready var TimerB_WaveB:float = 0.0

# Pattern C
onready var TimerC_WaveA:float = 0.0
onready var TimerC_WaveB:float = 0.0

# Pattern D
onready var TimerD_WaveA:float = 0.0
onready var TimerD_WaveB:float = 0.0

# Pattern E
onready var TimerE_WaveA:float = 0.0
onready var TimerE_WaveB:float = 0.0


# ----- Pattern spawners -------------------------------------------------------
func _SpawnPatternsA(delta:float) -> Array:
	var WaveA:Array
	var WaveB:Array
	
	# Bullet spiral
	TimerA_WaveA += delta
	if TimerA_WaveA > PATT_A_WAVE_A_BULLET_FREQ:
		TimerA_WaveA = 0.0
		WaveA = BulletSpiralSpawn(PATT_A_WAVE_A_SWEEP_SPEED, PATT_A_WAVE_A_BULLET_THREADS, PATT_A_WAVE_A_BULLET_SPEED)
	# Bullet cross
	TimerA_WaveB += delta
	if TimerA_WaveB > PATT_A_WAVE_B_BULLET_FREQ:
		TimerA_WaveB = 0.0
		WaveB = BulletThreadsSpawn(PATT_A_WAVE_B_BULLET_THREADS, PATT_A_WAVE_B_BULLET_SPEED)
	return WaveA + WaveB

func _SpawnPatternsB(delta:float) -> Array:
	var WaveA:Array
	var WaveB:Array
	
	# Bullet spiral
	TimerB_WaveA += delta
	if TimerB_WaveA > PATT_B_WAVE_A_BULLET_FREQ:
		TimerB_WaveA = 0.0
		WaveA = BulletSpiralSpawn(PATT_B_WAVE_A_SWEEP_SPEED, PATT_B_WAVE_A_BULLET_THREADS, PATT_B_WAVE_A_BULLET_SPEED)
	# Bullet cross
	TimerB_WaveB += delta
	if TimerB_WaveB > PATT_B_WAVE_B_BULLET_FREQ:
		TimerB_WaveB = 0.0
		WaveB = BulletThreadsSpawn(PATT_B_WAVE_B_BULLET_THREADS, PATT_B_WAVE_B_BULLET_SPEED)
	return WaveA + WaveB

func _SpawnPatternsC(delta:float) -> Array:
	var WaveA:Array
	var WaveB:Array
	
	# Bullet circle
	TimerC_WaveA += delta
	if TimerC_WaveA >= PATT_C_WAVE_A_BULLET_FREQ:
		TimerC_WaveA = 0.0
		WaveA = BulletCircleSpawn(PATT_C_WAVE_A_BULLET_COUNT, PATT_C_WAVE_A_BULLET_SPEED)
	# Bullet line towards the player
	TimerC_WaveB += delta
	if TimerC_WaveB >= PATT_C_WAVE_B_BULLET_FREQ:
		TimerC_WaveB = 0.0
		WaveB = BulletFollowerSpawn(PATT_C_WAVE_B_BULLET_SPEED)
	return WaveA + WaveB

func _SpawnPatternsD(delta:float) -> Array:
	var WaveA:Array
	var WaveB:Array
	
	# Bullet circle
	TimerD_WaveA += delta
	if TimerD_WaveA >= PATT_D_WAVE_A_BULLET_FREQ:
		TimerD_WaveA = 0.0
		WaveA = BulletCircleSpawn(PATT_D_WAVE_A_BULLET_COUNT, PATT_D_WAVE_A_BULLET_SPEED)
	# Bullet line towards the player
	TimerD_WaveB += delta
	if TimerD_WaveB >= PATT_D_WAVE_B_BULLET_FREQ:
		TimerD_WaveB = 0.0
		WaveB = BulletFollowerSpawn(PATT_D_WAVE_B_BULLET_SPEED)
	return WaveA + WaveB

func _SpawnPatternsE(delta:float) -> Array:
	var WaveA:Array
	var WaveB:Array
	
	# Bullet cross moving around
	TimerE_WaveA += delta
	if TimerE_WaveA >= PATT_E_WAVE_A_BULLET_FREQ:
		TimerE_WaveA = 0.0
		WaveA = BulletSpiralSpawn(PATT_E_WAVE_A_SWEEP_SPEED, PATT_E_WAVE_A_BULLET_THREADS, PATT_E_WAVE_A_BULLET_SPEED)
	# Bullet line towards the player
	TimerE_WaveB += delta
	if TimerE_WaveB >= PATT_E_WAVE_B_BULLET_FREQ:
		TimerE_WaveB = 0.0
		WaveB = BulletFollowerSpawn(PATT_E_WAVE_B_BULLET_SPEED)
	return WaveA + WaveB
