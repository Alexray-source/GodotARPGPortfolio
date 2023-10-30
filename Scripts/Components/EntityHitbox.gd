extends Area3D
class_name EntityHitboxComponent

@export var HEALTH_COMPONENT : HealthComponent

func TakeDamage(damageAmount):
	HEALTH_COMPONENT.TakeDamage(damageAmount)
