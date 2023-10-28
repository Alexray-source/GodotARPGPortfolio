extends Node3D
class_name SmoothPositionComponent

@export var END_TARGET : Node3D
@export var TARGET_NODE : Node3D
@export var POS_OFFSET : Vector3

@export var LERP_SPEED := 5.0

func _physics_process(delta):
	TARGET_NODE.global_position = lerp(TARGET_NODE.global_position, END_TARGET.global_position + POS_OFFSET, LERP_SPEED * delta)
