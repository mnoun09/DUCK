extends Camera2D

@onready var timer: Timer = $Timer
var is_active: bool = false
var left: bool = true
@export var max_shake: float = 30.0
@export var shake_fade: float = 30.0

var _shake_strength: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	repeat()
	is_active = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if left:
		position.x -= 4 * delta
		position.y += 2 * delta
	else:
		position.x += 4 * delta
		position.y -= 2 * delta 
	pass
	if _shake_strength > 0:
		_shake_strength = lerp(_shake_strength, 0.0, shake_fade*delta)
		offset = Vector2(randf_range(-_shake_strength, _shake_strength), (randf_range(-_shake_strength, _shake_strength))) 
		
func repeat():
	while true:
		await get_tree().create_timer(3).timeout
		left = !left

func _on_my_timer_timeout() -> void:
	pass # Replace with function body.

func trigger_shake() -> void:
	_shake_strength = max_shake
	
	
