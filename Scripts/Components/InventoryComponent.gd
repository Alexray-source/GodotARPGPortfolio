extends Node3D
class_name InventoryComponent

@export var Inventory : Array[InventorySlotResource]

func add_Item(slotItemRes: InventorySlotResource):
	var alreadyPresent = false
	var foundSlot:InventorySlotResource
	
	for slot in Inventory:
		if slot.InventoryItem.ItemName == slotItemRes.InventoryItem.ItemName:
			alreadyPresent = true
			foundSlot = slot
			break
	
	if alreadyPresent:
		foundSlot.slotAmount += slotItemRes.slotAmount
	else:
		Inventory.append(slotItemRes)
