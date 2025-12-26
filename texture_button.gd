extends TextureButton

@onready var camera: Camera2D = get_tree().get_first_node_in_group("camera")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://skyBreaking.tscn")
	pass # Replace with function body.
