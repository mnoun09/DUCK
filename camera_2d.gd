extends Camera2D

@onready var my_timer: Timer = $MyTimer
var is_active: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	is_active = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_active:
		position.x -= 10 * delta
		position.y += 10 * delta
		print(position.x)
	pass


func _on_my_timer_timeout() -> void:
	pass # Replace with function body.
