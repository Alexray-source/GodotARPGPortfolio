extends Node3D
class_name InputHandlerComponent

@export var IGNORE_INPUT := false

signal onMovementInput(InputDirection:Vector2)
signal onJumpInput()
signal onSprintInput()
signal onInventoryInput()

signal onSimpleAttack(dmgAmount:int)

signal onCameraInput(InputDirection:Vector2)

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	pass

func _input(event):
	if IGNORE_INPUT:
		return
	
	if event.is_action_pressed("jump"):
		onJumpInput.emit()
		
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		
	if event.is_action_pressed("sprint"):
		onSprintInput.emit(true)
	elif event.is_action_released("sprint"):
		onSprintInput.emit(false)
		
	if event.is_action_pressed("primary_attack"):
		onSimpleAttack.emit(10)
	
	if event.is_action_pressed("toggle_inventory"):
		onInventoryInput.emit()
	
	var inputDir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	onMovementInput.emit(inputDir)

func _unhandled_input(event):
	if IGNORE_INPUT:
		return
		
	if event is InputEventMouseMotion:
		onCameraInput.emit(Vector2(-event.relative.x, event.relative.y))
