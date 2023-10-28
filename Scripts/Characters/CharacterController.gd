extends CharacterBody3D
class_name CharacterController

@export var BASE_SPEED = 5.0
@export var SPRINT_SPEED = 8.0
@export var ACCELERATION_RATE = 1.0
@export var DEACCELERATION_RATE = 0.25
@export var JUMP_VELOCITY = 4.5
@export var TURN_SPEED = 2.0

var move_dir := Vector3(0,0,0)
var targetSpeed = BASE_SPEED

var is_sprinting := false
var ignoreInput := false

var currentSpeed = 0.0
var currentDirection = Vector3(0,0,0)

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func jump():
	if is_on_floor() and not ignoreInput:
		velocity.y = JUMP_VELOCITY

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		
	if is_sprinting:
		targetSpeed = SPRINT_SPEED
	else:
		targetSpeed = BASE_SPEED
	
	var direction = lerp(currentDirection, move_dir, TURN_SPEED * delta)
	currentDirection = direction
	
#	print(direction)
	
	#Only change direction if ignoreInput equals to false.
	if ignoreInput == false:
		if direction:
			currentSpeed = move_toward(currentSpeed, targetSpeed, ACCELERATION_RATE)
			
			velocity.x = direction.x * currentSpeed
			velocity.z = direction.z * currentSpeed
		else:
			currentSpeed = move_toward(currentSpeed, 0.0, DEACCELERATION_RATE)
			
			velocity.x = move_toward(velocity.x, 0, DEACCELERATION_RATE)
			velocity.z = move_toward(velocity.z, 0, DEACCELERATION_RATE)
			
	move_and_slide()
