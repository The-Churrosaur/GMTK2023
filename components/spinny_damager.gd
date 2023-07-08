
# returns get_damage based on velocity and rotation of body
class_name SpinnyDamager
extends DamageArea


@export var body : RigidBody2D
@export var factor = 0.0002


func get_damage() -> int:
	
	var damage = abs(body.linear_velocity.length()) * abs(body.angular_velocity)
	damage = damage * factor * contact_damage
	return(damage)
