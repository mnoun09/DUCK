extends Area2D
var dookie = preload("res://birdDookie.tscn")
@onready var animated_sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite.play("birdFlying")
	var waitTime = randi_range(0, 6)
	await get_tree().create_timer(waitTime).timeout
	generate_dookie()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= 300 * delta
	pass

func generate_dookie():
	var obs
	obs = dookie.instantiate()
	var obs_x : int = position.x
	var obs_y : int = position.y - 180
	add_dookie(obs, obs_x, obs_y)
	
func add_dookie(obs, x, y):
	obs.global_position = Vector2(x, y)
	get_tree().current_scene.add_child(obs)
