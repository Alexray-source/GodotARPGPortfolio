extends Node3D
class_name RotateComponent

@export var TARGET_NODE : Node3D

func RotateXY_To(InputDir:Vector2):
	TARGET_NODE.rotate(TARGET_NODE.transform.basis.x, -InputDir.y / 1000)
	TARGET_NODE.rotate(Vector3.UP, InputDir.x / 1000)
