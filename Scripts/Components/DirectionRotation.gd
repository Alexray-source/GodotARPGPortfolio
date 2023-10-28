extends Node3D
class_name DirectionRotationComponent

@export var TARGET_NODE : Node3D
var currentDirection := Vector3()

func RotateToDirection(Direction:Vector3):
	var lerpdirection = lerp(currentDirection, Direction, 0.01)
	if TARGET_NODE.global_position != (TARGET_NODE.global_position + lerpdirection):
		TARGET_NODE.look_at(TARGET_NODE.global_position + lerpdirection)
	currentDirection = lerpdirection
