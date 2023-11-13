extends Node3D
class_name HealthComponent

signal on_damage()
signal on_die()

@export var MAX_HEALTH := 100.0
@export var HEALTHBAR_SCENE : PackedScene
@export var HEALTHBAR_PARENT : Node3D
var Health

var healthBar : ProgressBar

func updateHealthDisplay():
	healthBar.value = (Health / MAX_HEALTH) * 100
	if healthBar.value == 100:
		healthBar.visible = false
	else:
		healthBar.visible = true

func _ready():	
	Health = MAX_HEALTH
	
	if HEALTHBAR_SCENE == null:
		return
	
	var subView = SubViewport.new()
	subView.disable_3d = true
	subView.transparent_bg = true
	
	HEALTHBAR_PARENT.add_child(subView)

	var Sprite = Sprite3D.new()
	HEALTHBAR_PARENT.add_child(Sprite)
	Sprite.texture = subView.get_texture()
	Sprite.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	
	healthBar = HEALTHBAR_SCENE.instantiate()
	subView.add_child(healthBar)
	
	updateHealthDisplay()

func TakeDamage(dmg_amount):
	Health -= dmg_amount
	on_damage.emit()
	
	if Health <= 0:
		Die()
	
	if HEALTHBAR_SCENE != null:
		updateHealthDisplay()

func Die():
	on_die.emit()

func Heal(heal_amount):
	pass
