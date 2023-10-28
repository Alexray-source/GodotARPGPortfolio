extends Node3D

@export var SCAN_COMPONENT : ScanComponent
@export var WALKTO_COMPONENT: WalkToComponent

func _ready():
	SCAN_COMPONENT.target_change.connect(on_target_change)

func on_target_change(newTarget:Node3D):
	WALKTO_COMPONENT.END_TARGET = newTarget
