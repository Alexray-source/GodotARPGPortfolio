extends Area3D
class_name EntityHitboxComponent

@export var HEALTH_COMPONENT : HealthComponent
@export var INVENTORY_COMPONENT : InventoryComponent
#@export var 

func TakeDamage(damageAmount):
	HEALTH_COMPONENT.TakeDamage(damageAmount)

func AddItem(slotItemRes):
	INVENTORY_COMPONENT.add_Item(slotItemRes)
