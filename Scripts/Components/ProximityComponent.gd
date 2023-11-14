extends Node3D
class_name ProximityComponent

signal on_interact

@export var SCAN_COMPONENT: ScanComponent

# Called when the node enters the scene tree for the first time.
func _ready():
	SCAN_COMPONENT.scan()
	SCAN_COMPONENT.target_change.connect(sendpromptSignal)

func sendpromptSignal():
	if SCAN_COMPONENT.closest_target != null and SCAN_COMPONENT.closest_target.is_in_group("Player"):
		GlobalSignals.onEvent.emit("ShowProxPrompt")
	elif SCAN_COMPONENT.closest_target == null:
		GlobalSignals.onEvent.emit("HideProxPrompt")

func _input(event):
	if event.is_action_pressed("proximity_interact") and SCAN_COMPONENT.closest_target != null:
		self.on_interact.emit()
