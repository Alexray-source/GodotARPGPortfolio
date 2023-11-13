extends Control
class_name HUDComponent

@export var HEALTH_COMPONENT: HealthComponent
@export var HEALTH_BAR: ProgressBar

@export var INVENTORY_COMPONENT: InventoryComponent
@export var INVENTORY_UI_CONTAINER: InventoryUIContainer
@export var INVENTORY_PANEL: Control

# Called when the node enters the scene tree for the first time.
func _ready():
	updateHealthInfo()
	HEALTH_COMPONENT.on_damage.connect(updateHealthInfo)

func toggleInventory():
	INVENTORY_PANEL.visible = !INVENTORY_PANEL.visible
	INVENTORY_UI_CONTAINER.updateInventory(INVENTORY_COMPONENT)
	
	if INVENTORY_PANEL.visible:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func updateHealthInfo():
	print("HUD Health updated")
	HEALTH_BAR.value = (HEALTH_COMPONENT.Health / HEALTH_COMPONENT.MAX_HEALTH) * 100
