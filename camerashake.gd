extends Camera2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	shake()
	pass
	
func shake() -> void:
	var shake_tween = create_tween()
	shake_tween.tween_property(self, "offset", offset + Vector2(randi_range(-2,-1), 0), 0.5)
	shake_tween.tween_property(self, "offset", offset + Vector2(randi_range(4,2), 0), 0.5)
	shake_tween.tween_property(self, "offset", offset + Vector2(0,0), 0.5)
	
