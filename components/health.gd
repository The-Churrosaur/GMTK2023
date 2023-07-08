
# manages health and hitbox
# detects damaging objects

class_name Health
extends Node2D



# FIELDS ===========



signal health_changed(new_health, max)

@export_subgroup("Health")

@export var max_health = 100
@export var starting_health = 100

@export_subgroup("Hitbox")

@export var hitbox : Area2D
@export var damage_area_group = "Enemy"

var health = 0



# CALLBACKS ===========



func _ready():
	hitbox.area_entered.connect(_on_hitbox_area_entered)
	add_health(starting_health)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



# PRIVATE ===========



func _on_hitbox_area_entered(area):
	if (area is DamageArea) and (area.is_in_group(damage_area_group)):
		remove_health(area.get_damage())



# PUBLIC =============



func add_health(amount):
	health = min(max_health, health + amount)
	print("health added: ", amount)
	emit_signal("health_changed", health, max_health)


func remove_health(amount) -> int:
	
	var damage = min(health, amount)
	health = max(0, health - amount)
	
	emit_signal("health_changed", health, max_health)
	return damage

