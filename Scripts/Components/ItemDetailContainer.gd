extends VBoxContainer
class_name ItemDetailContainer

@export var NAME_LABEL: Label
@export var DESCRIPTION_LABEL: Label
@export var TEXTURE_RECT: TextureRect

func showItemDetails(InventoryItem:InventoryItemResource):
	self.visible = true
	
	NAME_LABEL.text = InventoryItem.ItemName
	DESCRIPTION_LABEL.text = InventoryItem.Description
	TEXTURE_RECT.texture = InventoryItem.TextureIcon
