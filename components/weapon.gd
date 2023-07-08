
class_name Weapon
extends Node2D



# FIELDS ==========



@export var bullet_speed = 200
@export var bullet_prefab : PackedScene
@export var muzzle : Node2D
@export var automatic = true

@onready var cycle_timer = $CycleTimer


# function vars
var reloading = false
var trigger_pulled = false


# CALLBACKS ===========



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if trigger_pulled and !reloading: _fire()



# PUBLIC ==========



func pull_trigger():
	if trigger_pulled: return
	else: 
		trigger_pulled = true

func release_trigger():
	trigger_pulled = false



# PRIVATE ============



func _fire():
	
	var bullet : RigidBody2D = bullet_prefab.instantiate()
	level_data.current_level.add_child(bullet)
	
	bullet.global_transform = muzzle.global_transform
	bullet.linear_velocity = bullet.transform.x * bullet_speed
	
	reloading = true
	cycle_timer.start()


func _on_cycle_timer_timeout():
	reloading = false
