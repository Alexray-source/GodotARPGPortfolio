extends Area3D
class_name ScanComponent

@export var SCAN_TIME_IN_SEC := 0.5

var nearby_bodies = []
var closest_target : Node3D
var closest_target_distance : float

signal target_change(newTarget:Node3D)

func _ready():
	var scan_timer = Timer.new()
	add_child(scan_timer)
	
	scan_timer.one_shot = false
	scan_timer.start(SCAN_TIME_IN_SEC)
	scan_timer.connect("timeout", scan)
	
	body_entered.connect(on_body_enter)
	body_exited.connect(on_body_exit)

func on_body_enter(body : Node3D):
	if body.is_in_group("Player"):
		nearby_bodies.append(body)

func on_body_exit(body : Node3D):
	if nearby_bodies.find(body) != -1:
		nearby_bodies.erase(body)

func scan():
#	print(nearby_bodies)
	var prev_target = closest_target
	if nearby_bodies.find(closest_target) == -1:
		closest_target = null
	
	var closest_dist = INF
	
	for body in nearby_bodies:
		if (global_position - body.global_position).length() < closest_dist:
			closest_dist = (global_position - body.global_position).length() 
			closest_target = body
			closest_target_distance = closest_dist
	
	if closest_target != prev_target:
		print("TARGET CHANGED!!")
		target_change.emit(closest_target)
	return closest_target
