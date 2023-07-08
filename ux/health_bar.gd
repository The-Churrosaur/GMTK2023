
class_name HealthBar
extends ProgressBar


@export var health : Health


func _ready():
	print("healthbar connecting to health")
	health.health_changed.connect(_on_health_changed)


func _on_health_changed(amount, max):
	
	await _pause_juice_coroutine()
	
	max_value = max
	value = amount

func _pause_juice_coroutine():
	
	get_tree().paused = true
	await get_tree().create_timer(0.1).timeout
	get_tree().paused = false
