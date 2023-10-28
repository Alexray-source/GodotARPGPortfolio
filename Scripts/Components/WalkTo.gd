extends Node3D
class_name WalkToComponent

@export var END_TARGET : Node3D
@export var VEL_CONTROLLER : VelocityControllerComponent

@export var REACHED_THRESHOLD := 2.0

func _process(delta):
	if END_TARGET == null or (END_TARGET.global_position - VEL_CONTROLLER.global_position).length() <= REACHED_THRESHOLD:
		VEL_CONTROLLER.currentDirection = Vector3(0,0,0)
		return
	
	VEL_CONTROLLER.currentDirection = (END_TARGET.global_position - VEL_CONTROLLER.global_position).normalized()
