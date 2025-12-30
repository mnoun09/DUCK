extends Area2D

@onready var animated_sprite = $AnimatedSprite2D

@export var damage: = 1
var moving := true
var hit := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite.play("default")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if moving:
		position.y += 450 * delta
		pass
	if hit:
		position.y += 80 * delta
		pass
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.on_hit_by_meteor(damage)
		print ("hit")
		moving = false
		hit = true
		animated_sprite.play("breaking")
		await animated_sprite.animation_finished
		animated_sprite.stop()
		queue_free()
	moving = false
	hit = true
	animated_sprite.play("breaking")
	await animated_sprite.animation_finished
	animated_sprite.stop()
	queue_free()
	pass # Replace with function body.
