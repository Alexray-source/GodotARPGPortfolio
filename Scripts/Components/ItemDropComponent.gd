extends Node3D
class_name ItemDropComponent

@export var AREA : Area3D
@export var ItemSlot: InventorySlotResource

func _ready():
	$Timer.start()
	await ($Timer.timeout)
	AREA.area_entered.connect(areaEntered)

func areaEntered(area):
	if area is EntityHitboxComponent:
		area.AddItem(ItemSlot)
		self.queue_free()
#
#func Destroy():
#	get_sc
