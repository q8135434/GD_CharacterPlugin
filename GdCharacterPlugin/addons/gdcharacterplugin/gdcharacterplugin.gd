@tool
extends EditorPlugin


func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	add_custom_type("Characters", "Node", preload("res://addons/gdcharacterplugin/Characters/Characters.gd"), EditorInterface.get_base_control().get_theme_icon("Node", "EditorIcons"))
	pass


func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	remove_custom_type("Characters")
	pass
