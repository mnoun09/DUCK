extends Area2D
@onready var animated_sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.y > 180:
		position.y += 0
	else:
		position.y += 90 * delta
	pass


func _on_body_entered(body: Node2D) -> void:
	animated_sprite.play("boom")
	await animated_sprite.animation_finished
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://finalScene.tscn")
	
	pass # Replace with function body.
