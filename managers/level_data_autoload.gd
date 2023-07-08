
# stores data between levels
class_name LevelDataAutoload
extends Node


# root of current level
var current_level


func set_current_level(level_root):
	current_level = level_root
	print("NEW LEVEL SET: ", current_level)
