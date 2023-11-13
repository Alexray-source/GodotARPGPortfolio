extends GridContainer
class_name InventoryUIContainer

const InvSlotUI = preload("res://Preset Scenes/UI/inventory_slot.tscn")

@export var ITEM_DETAIL_CONTAINER:ItemDetailContainer

func clearGrid():
	for child in self.get_children():
		child.queue_free()

func updateInventory(InvComponent:InventoryComponent):
	clearGrid()
	ITEM_DETAIL_CONTAINER.visible = false
	
	for invSlotResource in InvComponent.Inventory:
		var currentInvSlotButton = InvSlotUI.instantiate()
		self.add_child(currentInvSlotButton)
		
		currentInvSlotButton.texture_normal = invSlotResource.InventoryItem.TextureIcon
#		currentInvSlotButton.
		currentInvSlotButton.get_node("CountLabel").text = str( invSlotResource.slotAmount)
		
		currentInvSlotButton.pressed.connect(ITEM_DETAIL_CONTAINER.showItemDetails.bind(invSlotResource.InventoryItem))
		
