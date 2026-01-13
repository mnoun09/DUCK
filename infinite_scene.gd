extends ColorRect

@onready var player = $"Player"
@onready var bg = $"ColorRect"

var targetColor = Color(0.627, 0.871, 0.973, 1.0)
var rock = preload("res://rock.tscn")
var rock2 = preload("res://rock2.tscn")
var rock3 = preload("res://rock_3.tscn")
var star = preload("res://star2.tscn")
var chair = preload("res://chair.tscn")
var meteor = preload("res://meteor.tscn")
var bird = preload("res://bird.tscn")
var moon = preload("res://moon.tscn")
var totalScore : int = 0
var collectedScore : int = 0
var obstacle_types := [rock, rock2, rock3]
var obstacles : Array
var spawn := true
var stopScoring : bool = false
var points : int = 1
var score : int = 0
var spawnSpeed : float = 1.5
var gameWon: = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawning_rock()
	scoring()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass

func generate_rock():
	print (obstacle_types)
	#if obstacles.is_empty():
	var obs_type = obstacle_types[randi() % obstacle_types.size()]
	var obs 
	var obs_y : int
	
	obs = obs_type.instantiate()
	var obs_x : int 
	if obs.scene_file_path == "res://meteor.tscn":
		print("obs = meteor")
		obs_x = randi_range(0, 800)
		obs_y  = randi_range(-500, -300)
	elif obs.scene_file_path == "res://bird.tscn":
		print("obs = bird")
		obs_x = randi_range(1280, 1300)
		obs_y  = randi_range(350, 450)
	else:
		obs_x = randi_range(20, 1250)
		obs_y = randi_range(-100, 0)
	print (obs)
	print (meteor)
	add_rock(obs, obs_x, obs_y)		
	
func add_rock(obs, x, y):
	obs.position = Vector2i(x, y)
	add_child(obs)
	obstacles.append(obs)

func spawning_rock():
	while true:
		await get_tree().create_timer(spawnSpeed).timeout
		if not spawn:
			return
		generate_rock()
		
		
func scoring():
	
	while player.alive and spawn:
		await get_tree().create_timer(.1).timeout
		score+= points
		totalScore+= points
		if totalScore == 50:
			obstacle_types.append(bird)
		elif totalScore == 100:
			obstacle_types.append(chair)
		elif totalScore == 200:
			obstacle_types.append(meteor)
		print (score)
		spawn_star()
		if spawnSpeed >= 1.0:
			spawnSpeed -= 0.1
	if not spawn:
		spawn_moon()
		
		
func spawn_star():
	if score == 50:
		stopScoring = true
		var starObject = star.instantiate()
		var star_x : int = randi_range(20, 1000)
		starObject.position = Vector2i(star_x, 0)
		add_child(starObject)
		print("spawned")
		score = 0
		print("score reset")
		collectedScore += 50
		
func spawn_moon():

	var moonObject = moon.instantiate()
	moonObject.position = Vector2i(0, -500)
	add_child(moonObject)
		
	
