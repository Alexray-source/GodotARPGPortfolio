extends Area3D
class_name AttackAreaComponent

@export var AttackPivot : Node3D
var CollisionShape = null

var overlappingAreas = []

func _ready():
	CollisionShape = $CollisionShape3D
	area_entered.connect(areaEntered)
	area_exited.connect(areaExited)

func areaEntered(area):
	if not area in overlappingAreas:
		overlappingAreas.append(area)

func areaExited(area):
	if area in overlappingAreas:
		overlappingAreas.erase(area)

func initiateAttack( size:Vector3, damage:int):
	var hitbox := BoxShape3D.new()
	hitbox.size = size
	
	CollisionShape.shape = hitbox

	var mesh = MeshInstance3D.new()
	var renderedMesh = BoxMesh.new()
	
	add_child(mesh)
	
	renderedMesh.size = size
	
	mesh.mesh = renderedMesh
	mesh.global_position = CollisionShape.global_position
	
	for area in overlappingAreas:
		if area is EntityHitboxComponent:
			print(area)
			var foundHitbox = area
			area.TakeDamage(damage)
	
	get_tree().create_timer(1).timeout.connect(func ():
		mesh.queue_free()
	)
