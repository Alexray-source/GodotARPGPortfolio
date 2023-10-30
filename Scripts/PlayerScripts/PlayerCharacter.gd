extends Node3D

@export var CAMERA:Node3D

@export var INPUT_HANDLER : InputHandlerComponent
@export var VEL_CONTROLLER : VelocityControllerComponent
@export var ROTATE_COMPONENT : RotateComponent
@export var ATTACKAREA_COMPONENT : AttackAreaComponent
@export var SPRINT_SPEED_MULTIPLIER := 2.0

var is_sprinting := false
var cached_base_speed := 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	cached_base_speed = VEL_CONTROLLER.MOVE_SPEED
	INPUT_HANDLER.connect("onJumpInput", playerJumpAttempt)
	INPUT_HANDLER.connect("onMovementInput", movementInputChanged)
	INPUT_HANDLER.connect("onSprintInput", sprintInputChanged)
	
	INPUT_HANDLER.connect("onCameraInput", rotateCamera)
	INPUT_HANDLER.connect("onSimpleAttack", meleeAttack)

func playerJumpAttempt():
	VEL_CONTROLLER.jump()

func meleeAttack(dmg:int):
	ATTACKAREA_COMPONENT.initiateAttack(Vector3(4,4,4), 10)

func rotateCamera(inputDir:Vector2):
	ROTATE_COMPONENT.RotateXY_To(inputDir)

func sprintInputChanged(isActive:bool):
	is_sprinting = isActive

func movementInputChanged(inputDir:Vector2):
	var cameraForwardBasis = CAMERA.global_transform.basis.z
	var cameraRightBasis = CAMERA.global_transform.basis.x
	
	cameraForwardBasis = cameraForwardBasis.slide(Vector3.UP).normalized()
	var targetdirection = cameraForwardBasis * inputDir.y + cameraRightBasis * inputDir.x
	
	if is_sprinting:
		VEL_CONTROLLER.MOVE_SPEED = cached_base_speed * SPRINT_SPEED_MULTIPLIER
	else:
		VEL_CONTROLLER.MOVE_SPEED = cached_base_speed
	
	VEL_CONTROLLER.targetDirection = targetdirection
