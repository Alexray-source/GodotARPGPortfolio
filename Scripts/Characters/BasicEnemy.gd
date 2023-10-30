extends Node3D

@export var SCAN_COMPONENT : ScanComponent
@export var WALKTO_COMPONENT: WalkToComponent
@export var ATTACKAREA_COMPONENT : AttackAreaComponent

func _ready():
	SCAN_COMPONENT.target_change.connect(on_target_change)
	$Timer.timeout.connect(attack)

func on_target_change(newTarget:Node3D):
	WALKTO_COMPONENT.END_TARGET = newTarget
	
	if newTarget != null:
		$Timer.start(0.5)
	else:
		$Timer.stop()

func attack():
	ATTACKAREA_COMPONENT.initiateAttack(Vector3(7,5,7), 5)
