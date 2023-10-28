extends Node3D
class_name AnimatorComponent

@export var ANIMATION_TREE : AnimationTree

func setGrounded(state : bool):
	ANIMATION_TREE.set("parameters/DefaultMovement/conditions/IsGrounded", state)

func setFalling(state : bool):
	ANIMATION_TREE.set("parameters/DefaultMovement/conditions/IsFalling", state)

func setJumping(state : bool):
	ANIMATION_TREE.set("parameters/DefaultMovement/conditions/IsJumping", state)

func setGroundSpeed(blend : float):
	ANIMATION_TREE.set("parameters/DefaultMovement/GroundMovement/blend_position", blend)
