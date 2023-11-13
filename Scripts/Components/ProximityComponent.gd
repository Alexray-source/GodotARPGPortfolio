extends Node3D
class_name ProximityComponent

signal on_interact

@export var SCAN_COMPONENT: ScanComponent

# Called when the node enters the scene tree for the first time.
func _ready():
	SCAN_COMPONENT.scan()

func _input(event):
	if event.is_action_pressed("proximity_interact") and SCAN_COMPONENT.closest_target != null:
		self.on_interact.emit()
