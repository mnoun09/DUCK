extends ColorRect

@onready var player = $"Player"

var rock = preload("res://rock.tscn")
var spawn := true
var points : int = 1
var score : int = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass

func generate_rock():
	var obs
	obs = rock.instantiate()
	var obs_x : int = randi_range(20, 1250)
	var obs_y : int = randi_range(0, 350)
	add_rock(obs, obs_x, obs_y)
	
func add_rock(obs, x, y):
	obs.position = Vector2i(x, y)
	add_child(obs)

func spawning_rock():
	while spawn:
		await get_tree().create_timer(0.5).timeout
		generate_rock()
		
func scoring():
	while player.alive:
		await get_tree().create_timer(.1).timeout
		score+=points
		print (score)
	
