extends Node3D

@export var SCAN_COMPONENT : ScanComponent
@export var WALKTO_COMPONENT: WalkToComponent
@export var ATTACKAREA_COMPONENT : AttackAreaComponent
@export var HEALTH_COMPONENT : HealthComponent
@export var ANIMATOR_COMPONENT : AnimatorComponent
@export var INV_DROP_COMPONENT : DropInventoryComponent

@export var AttackRange := 15.0

func _ready():
	SCAN_COMPONENT.target_change.connect(on_target_change)
	HEALTH_COMPONENT.on_damage.connect(on_dead)
	$Timer.timeout.connect(attack)

func on_dead():
	if HEALTH_COMPONENT.Health <= 0 and INV_DROP_COMPONENT.INVENTORY_COMPONENT != null:
		INV_DROP_COMPONENT.DropItems()
		queue_free()

func on_target_change(newTarget:Node3D):
	WALKTO_COMPONENT.END_TARGET = newTarget

	if newTarget != null:
		$Timer.start(0.5)
	else:
		$Timer.stop()

func attack():
	if SCAN_COMPONENT.closest_target_distance <= AttackRange:
#		ATTACKAREA_COMPONENT.initiateAttack(Vector3(7,5,7), 5)
		ANIMATOR_COMPONENT.playAttack()
