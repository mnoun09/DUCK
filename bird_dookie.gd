extends Area2D
class_name Dookie

var splatter = preload("res://splatter.tscn")
@onready var camera = get_tree().get_first_node_in_group("player_camera")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += 300 * delta
	pass


func _on_body_entered(body: Node2D) -> void:
	generate_splatter()
	pass # Replace with function body.
	
func generate_splatter():
	var obs
	obs = splatter.instantiate()
	var obs_x = 0
	var obs_y = 0
	add_splatter(obs, obs_x, obs_y)
	
func add_splatter(obs, x, y):
	camera.add_child(obs)
	obs.position = Vector2.ZERO
