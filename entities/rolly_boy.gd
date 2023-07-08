
class_name RollyBoy
extends RigidBody2D



# FIELDS ==========



@export var jump_force = 5000.0


# -- input

var jump_input = false




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	_process_input(delta)


func _physics_process(delta):
	
	if jump_input == true:
		apply_force(Vector2.UP * jump_force)


func _process_input(delta):
	
	jump_input = Input.is_action_pressed("ui_accept")

