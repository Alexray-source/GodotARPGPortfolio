extends CharacterBody3D
class_name VelocityControllerComponent

@export var ANIMATOR_COMPONENT: AnimatorComponent

#@export var CHARACTER_BODY : CharacterBody3D
@export var TURN_SPEED := 5.0
@export var MOVE_SPEED := 4.0
@export var JUMP_VELOCITY := 4.5
@export var GRAVITY_SCALE := 1.0

@export var IGNORE_GRAVITY := false

var currentDirection : Vector3
var targetDirection : Vector3

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func UpdateVelocity(newDirection):
	targetDirection = newDirection

func jump():
	if is_on_floor():
		velocity.y = JUMP_VELOCITY
		
		if ANIMATOR_COMPONENT:
			ANIMATOR_COMPONENT.setJumping(true)
			ANIMATOR_COMPONENT.setJumping(false)

func _physics_process(delta):	
	
	if is_on_floor():
		
		if ANIMATOR_COMPONENT:
			ANIMATOR_COMPONENT.setFalling(false)
			ANIMATOR_COMPONENT.setGrounded(true)
	
	if not is_on_floor() and not IGNORE_GRAVITY:
		
		if ANIMATOR_COMPONENT:
			ANIMATOR_COMPONENT.setFalling(true)
			ANIMATOR_COMPONENT.setGrounded(false)
		
		velocity.y -= gravity * GRAVITY_SCALE * delta
		
	var direction = lerp(currentDirection, targetDirection, TURN_SPEED * delta)
	currentDirection = direction
	
	var outputVelocity = Vector3(currentDirection.x * MOVE_SPEED, currentDirection.y, currentDirection.z * MOVE_SPEED)
	
	velocity = Vector3(outputVelocity.x, velocity.y , outputVelocity.z)
	
	if ANIMATOR_COMPONENT:
		ANIMATOR_COMPONENT.setGroundSpeed(MOVE_SPEED / velocity.length())
	
	move_and_slide()
