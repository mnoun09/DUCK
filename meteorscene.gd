extends ColorRect

@onready var player = $"Player"
var meteor = preload("res://meteor.tscn")
var star = preload("res://star.tscn")
@onready var label = $"MeteorLabel"
var points : int = 1
var score : int = 0
var stop : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(1).timeout
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func generate_meteor():
	var obs
	obs = meteor.instantiate()
	var obs_x : int = 686
	var obs_y : int = 400
	await get_tree().create_timer(1.0).timeout
	print("Timer finished!")
	add_meteor(obs, obs_x, obs_y)
	
func add_meteor(obs, x, y):
	obs.position = Vector2i(x, y)
	add_child(obs)


func _on_timer_timeout() -> void:
	
	pass # Replace with function body.

func scoring():
	while player.alive and !stop:
		await get_tree().create_timer(.1).timeout
		score+=points
		print (score)
		spawn_star()
	
func spawn_star():
	if score == 50:
		stop = true
		var starObject = star.instantiate()
		starObject.position = Vector2i(1000, 580)
		add_child(starObject)
		label.star_spawned()
		print("spawned")
		
