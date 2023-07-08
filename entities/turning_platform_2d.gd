
# manipulable physics box, level base, rotates around origin
class_name TurningPlatform2D
extends RigidBody2D



# FIELDS ==========



@export var spin_torque = 100.0
@export var jump_force = 5000.0

# -- input vars

var rotation_input = 0.0
var jump_input = false



# CALLBACKS ==========



func _ready():
	pass # Replace with function body.


func _process(delta):
	
	_process_input(delta)


func _physics_process(delta):
	
	apply_torque(rotation_input * spin_torque)
	if jump_input:
		apply_force(Vector2.DOWN * jump_force)


func _process_input(delta):
	
	rotation_input = Input.get_axis("ui_left", "ui_right")
#	jump_input = Input.is_action_pressed("ui_accept")


