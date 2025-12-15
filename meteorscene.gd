extends ColorRect

var meteor = preload("res://meteor.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generate_meteor()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func generate_meteor():
	var obs
	obs = meteor.instantiate()
	var obs_x : int = 686
	var obs_y : int = 400
	add_meteor(obs, obs_x, obs_y)
	
func add_meteor(obs, x, y):
	obs.position = Vector2i(x, y)
	add_child(obs)
