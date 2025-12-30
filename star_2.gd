extends Area2D
@onready var star = $"."
@onready var bg = $"../ColorRect"
var targetColor = Color(0.627, 0.871, 0.973, 1.0)
var speed := 10.0
var color
var update := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	speed += 0.001
	if position.y > 500:
		position.y += 0
	else:
		position.y += 90 * delta
		
	if update:
		updateColor(delta)
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		update = true
		await get_tree().create_timer(.02).timeout
		update = false
		if speed < 100.0:
			speed += 0.5
		else:
			speed +=50
		queue_free()
	pass # Replace with function body.

func updateColor(delta: float):
	bg.color = bg.color.lerp(targetColor, speed * delta)
	print("color changed")
