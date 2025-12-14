extends Node

var bird_scene = preload("res://bird.tscn")
var birdpoo = preload("res://birdDookie.tscn")
var obstacles : Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generate_obs()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass


func generate_obs():
	var obs
	obs = bird_scene.instantiate()
	var obs_x : int = 1280
	var obs_y : int = 1000
	add_obs(obs, obs_x, obs_y)
	
	var secondObs 
	secondObs = birdpoo.instantiate()
	var secondObs_x : int = 800
	var secondObs_y : int = 1000
	add_obs(secondObs, secondObs_x, secondObs_y)
		
func add_obs(obs, x , y):
	obs.position = Vector2i(x, y)
	add_child(obs)
