extends Node3D

@export var HEALTH_COMPONENT: HealthComponent
@export var DROPINV_COMPONENT: DropInventoryComponent

# Called when the node enters the scene tree for the first time.
func _ready():
	HEALTH_COMPONENT.on_die.connect(DropAndDestroy)

func DropAndDestroy():
	DROPINV_COMPONENT.DropItems()
	queue_free()
