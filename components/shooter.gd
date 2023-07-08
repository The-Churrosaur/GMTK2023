
# detects enemies
# wields a Weapon at them

class_name Shooter 
extends Node2D



# FIELDS ===========



@export var enemy_group = "Player"
@export var weapon : Weapon
@export var lead_target = false

@onready var detection_area = $Area2D
@onready var raycast = $RayCast2D


var target



# CALLBACKS ===========



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	
	if target != null:
		_aim_at(target)
		if raycast.get_collider() == target:
			weapon.pull_trigger()
		else:
			weapon.release_trigger()
	else:
		weapon.release_trigger()


func _on_area_2d_area_entered(area):
	
	pass # Replace with function body.
	

func _on_area_2d_body_entered(body):
	if body.is_in_group(enemy_group):
		_set_target(body)


func _on_area_2d_body_exited(body):
	if body.is_in_group(enemy_group):
		_remove_target(body)



# PRIVATE ==========



func _set_target(body):
	print("shooter target set: ", body)
	target = body


func _remove_target(body):
	if target == body: target = null


# rotate weapon towards target (global)
func _aim_at(target):
	
	if lead_target:
		pass # TODO
	
	# TODO lerp it
	var to_target = target.global_position - weapon.global_position
	weapon.global_rotation = to_target.angle()
	
	raycast.global_transform = weapon.muzzle.global_transform
