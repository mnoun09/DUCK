extends Node2D
@onready var animated_sprite = $AnimatedSprite2D
@onready var camera: Camera2D = get_tree().get_first_node_in_group("camera")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	camera.trigger_shake()
	animated_sprite.play("breaking")
	await animated_sprite.animation_finished
	get_tree().change_scene_to_file("res://meteorscene.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
