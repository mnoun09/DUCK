extends Area2D

@onready var animated_sprite = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite.play("default")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= 200 * delta
	position.y += 200 * delta
	pass


func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	print ()
	pass # Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
