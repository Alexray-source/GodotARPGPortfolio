extends Node3D

@export var PROXIMITY_COMPONENT : ProximityComponent
@export var DROPINV_COMPONENT : DropInventoryComponent
@export var INVENTORY_COMPONENT : InventoryComponent

@export var INVENTORY : Array[InventorySlotResource]

func _ready():
	INVENTORY_COMPONENT.Inventory = INVENTORY
	PROXIMITY_COMPONENT.on_interact.connect(OpenChest)

func OpenChest():
	DROPINV_COMPONENT.DropItems()
	queue_free()
