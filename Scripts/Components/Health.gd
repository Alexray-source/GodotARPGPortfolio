extends Node3D
class_name HealthComponent

@export var MAX_HEALTH := 100.0
var Health := MAX_HEALTH

func TakeDamage(dmg_amount):
	Health -= dmg_amount
	print("ATTACKED!!!")
	if Health <= 0:
		Die()

func Die():
	get_parent_node_3d().queue_free()

func Heal(heal_amount):
	pass
