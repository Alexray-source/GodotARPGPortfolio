extends Node3D
class_name AnimatorComponent

@export var ANIMATION_TREE : AnimationTree
@export var ATTACK_ANIMATIONS : AttackAnimationResource

var attackChainCount = 0

var attackAnimCd = false

func _ready():
	ANIMATION_TREE.animation_finished.connect(clearAttackCooldown)

func setGrounded(state : bool):
	ANIMATION_TREE.set("parameters/DefaultMovement/conditions/IsGrounded", state)

func setFalling(state : bool):
	ANIMATION_TREE.set("parameters/DefaultMovement/conditions/IsFalling", state)

func setJumping(state : bool):
	ANIMATION_TREE.set("parameters/DefaultMovement/conditions/IsJumping", state)

func setGroundSpeed(blend : float):	
#	if ANIMATION_TREE.get("parameters/Transition/transition_request") == "Attack":
#		ANIMATION_TREE.set("parameters/Transition/transition_request", "Normal")
	ANIMATION_TREE.set("parameters/DefaultMovement/GroundMovement/blend_position", blend)

func clearAttackCooldown():
	attackAnimCd = false

func onAnimFinished(anim_name):
	if ATTACK_ANIMATIONS.animations.find(anim_name) != -1:
		attackAnimCd = false

func playAttack():
	if attackAnimCd == false and ANIMATION_TREE.get("parameters/DefaultMovement/conditions/IsGrounded") == true:
		attackAnimCd = true
		#NOTE: Setting animation INSIDE of animation tree node. Expects to have a "AttackAnimation" animation node inside the root tree.
		#Might want to find a better solution, as this forces the use of "AttackAnimation" animation node.
		ANIMATION_TREE.tree_root.get_node("AttackAnimation").animation = ATTACK_ANIMATIONS.animations[attackChainCount]
		ANIMATION_TREE.set("parameters/Transition/transition_request", "Attack")
		
		attackChainCount += 1
		if attackChainCount >= ATTACK_ANIMATIONS.animations.size():
			attackChainCount = 0
