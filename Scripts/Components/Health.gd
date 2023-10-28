extends Node3D
class_name HealthComponent

@export var MAX_HEALTH := 100.0
var Health := MAX_HEALTH

func TakeDamage(dmg_amount):
	pass

func Die():
	pass

func Heal(heal_amount):
	pass
