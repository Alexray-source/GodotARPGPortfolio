extends Node3D
class_name DropInventoryComponent

@export var INVENTORY_COMPONENT : InventoryComponent
@export var DropOrigin: Node3D

const itemDropScene = preload("res://Preset Scenes/Inventory/ItemDrop.tscn")

func DropItems():
	for Slot in INVENTORY_COMPONENT.Inventory:
		var instancedDrop = itemDropScene.instantiate()
		get_tree().root.add_child(instancedDrop)
		
		instancedDrop.global_position = DropOrigin.global_position
		instancedDrop.ItemSlot = Slot
		instancedDrop.apply_impulse(Vector3.UP * randf_range(5,10) + Vector3.RIGHT * randf_range(-15,15) + Vector3.FORWARD * randf_range(-15,15))
