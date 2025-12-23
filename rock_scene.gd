extends ColorRect

var rock = preload("res://rock.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generate_rock()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func generate_rock():
	var obs
	obs = rock.instantiate()
	var obs_x : int = 686
	var obs_y : int = 400
	add_rock(obs, obs_x, obs_y)
	
func add_rock(obs, x, y):
	obs.position = Vector2i(x, y)
	add_child(obs)
