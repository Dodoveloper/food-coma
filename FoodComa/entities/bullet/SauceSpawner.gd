extends SpawnerEngine


# ----- Configuration ----------------------------------------------------------
# Pattern A
const PATT_A_BULLET_FREQ:float = 0.5
const PATT_A_BULLET_THREADS:int = 4
const PATT_A_BULLET_SPEED:float = 200.0
const PATT_A_SWEEP_SPEED:float = 0.2

# Pattern B
const PATT_B_BULLET_FREQ:float = PATT_A_BULLET_FREQ
const PATT_B_BULLET_THREADS:int = PATT_A_BULLET_THREADS
const PATT_B_BULLET_SPEED:float = PATT_A_BULLET_SPEED
const PATT_B_SWEEP_SPEED:float = PATT_A_SWEEP_SPEED

# Pattern C
const PATT_C_BULLET_FREQ:float = PATT_A_BULLET_FREQ
const PATT_C_BULLET_THREADS:int = PATT_A_BULLET_THREADS
const PATT_C_BULLET_SPEED:float = PATT_A_BULLET_SPEED
const PATT_C_SWEEP_SPEED:float = PATT_A_SWEEP_SPEED

# Pattern D
const PATT_D_BULLET_FREQ:float = PATT_A_BULLET_FREQ
const PATT_D_BULLET_THREADS:int = PATT_A_BULLET_THREADS
const PATT_D_BULLET_SPEED:float = PATT_A_BULLET_SPEED
const PATT_D_SWEEP_SPEED:float = PATT_A_SWEEP_SPEED

# Pattern E
const PATT_E_BULLET_FREQ:float = PATT_A_BULLET_FREQ
const PATT_E_BULLET_THREADS:int = PATT_A_BULLET_THREADS
const PATT_E_BULLET_SPEED:float = PATT_A_BULLET_SPEED
const PATT_E_SWEEP_SPEED:float = PATT_A_SWEEP_SPEED


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
onready var TimerE:float = 0.0


# ----- Pattern spawners -------------------------------------------------------
func _SpawnPatternsA(delta:float) -> Array:
	var Wave:Array
	
	# Swirling bullets
	TimerA += delta
	if TimerA > PATT_A_BULLET_FREQ:
		TimerA = 0.0
		Wave = BulletSpiralSpawn(PATT_A_SWEEP_SPEED, PATT_A_BULLET_THREADS, PATT_A_BULLET_SPEED)
	return Wave

func _SpawnPatternsB(delta:float) -> Array:
	var Wave:Array
	
	# Swirling bullets
	TimerB += delta
	if TimerB > PATT_B_BULLET_FREQ:
		TimerB = 0.0
		Wave = BulletSpiralSpawn(PATT_B_SWEEP_SPEED, PATT_B_BULLET_THREADS, PATT_B_BULLET_SPEED)
	return Wave

func _SpawnPatternsC(delta:float) -> Array:
	var Wave:Array
	
	# Swirling bullets
	TimerC += delta
	if TimerC > PATT_C_BULLET_FREQ:
		TimerC = 0.0
		Wave = BulletSpiralSpawn(PATT_C_SWEEP_SPEED, PATT_C_BULLET_THREADS, PATT_C_BULLET_SPEED)
	return Wave

func _SpawnPatternsD(delta:float) -> Array:
	var Wave:Array
	
	# Swirling bullets
	TimerD += delta
	if TimerD > PATT_B_BULLET_FREQ:
		TimerD = 0.0
		Wave = BulletSpiralSpawn(PATT_D_SWEEP_SPEED, PATT_D_BULLET_THREADS, PATT_D_BULLET_SPEED)
	return Wave

func _SpawnPatternsE(delta:float) -> Array:
	var Wave:Array
	
	# Swirling bullets
	TimerE += delta
	if TimerE > PATT_E_BULLET_FREQ:
		TimerE = 0.0
		Wave = BulletSpiralSpawn(PATT_E_SWEEP_SPEED, PATT_E_BULLET_THREADS, PATT_E_BULLET_SPEED)
	return Wave
