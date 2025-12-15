extends Area2D

@onready var animated_sprite = $AnimatedSprite2D

@export var damage: = 1
var moving := true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite.play("default")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not moving: 
		return
		
	position.x -= 300 * delta
	position.y += 300 * delta
	pass

func _on_body_entered(body):
	if body is CharacterBody2D:
		moving = false
		body.on_hit_by_meteor(damage)
		print ("hit")
		animated_sprite.stop()
		queue_free()
		
	pass # Replace with function body.
