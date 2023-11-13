extends Area3D
class_name AttackAreaComponent

@export var AttackPivot : Node3D
@export var CharacterData : CharacterDataResource
var CollisionShape = null

var overlappingAreas = []

func _ready():
	CollisionShape = $CollisionShape3D
#	area_entered.connect(areaEntered)
#	area_exited.connect(areaExited)
#
#func areaEntered(area):
#	if not area in overlappingAreas:
#		overlappingAreas.append(area)
#
#func areaExited(area):
#	if area in overlappingAreas:
#		overlappingAreas.erase(area)

func initiateAttack( size:Vector3, damageMultiplier:float):
	var hitbox := BoxShape3D.new()
	hitbox.size = size
	
#	CollisionShape.shape = hitbox
	var space_state = get_world_3d().direct_space_state
	var params = PhysicsShapeQueryParameters3D.new()
	params.shape = hitbox
	params.exclude = [self.get_rid(),$"../EntityHitboxComponent".get_rid() ]
	params.collide_with_bodies = false
	params.collide_with_areas = true
	params.transform = global_transform
	params.collision_mask = collision_mask
	
	var overlappingAreas = space_state.intersect_shape(params)
	print(overlappingAreas)
#	var mesh = MeshInstance3D.new()
#	var renderedMesh = BoxMesh.new()
#
#	get_tree().root.add_child(mesh)
#
#	renderedMesh.size = hitbox.size
#
#	mesh.mesh = renderedMesh
#	mesh.transform = params.transform
#
	for area in overlappingAreas:
		if area.collider is EntityHitboxComponent:
			print(area)
			var foundHitbox = area.collider as EntityHitboxComponent
			foundHitbox.TakeDamage(CharacterData.baseDamage * damageMultiplier)
	
#	get_tree().create_timer(1).timeout.connect(func ():
#		mesh.queue_free()
#	)
