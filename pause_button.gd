extends Control
var on := false
@onready var infiniteScene = $"../../../.."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$TextureButton.focus_mode = Control.FOCUS_NONE
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pass


func _on_texture_button_toggled(toggled_on: bool) -> void:
	
	get_tree().paused = toggled_on
	infiniteScene.spawn = !toggled_on
	if not toggled_on:
		
		infiniteScene.spawning_rock()
		infiniteScene.scoring()
	pass # Replace with function body.

	
