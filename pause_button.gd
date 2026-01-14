extends Control
var on := false
@onready var infiniteScene = $"../../../.."
var home = preload("res://homeButton.tscn")
var cont = preload("res://contButton.tscn")
var homeObject: Node = null



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$TextureButton.focus_mode = Control.FOCUS_NONE
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pass


func _on_texture_button_toggled(toggled_on: bool) -> void:
	
	get_tree().paused = toggled_on
	on = !on
	infiniteScene.spawn = !toggled_on
	home_button()
	
	if not toggled_on:
		homeObject.visible = false
		infiniteScene.spawning_rock()
		infiniteScene.scoring()
		
	pass # Replace with function body.
	
func home_button():
	if homeObject == null:
		homeObject = home.instantiate()
		homeObject.process_mode = Node.PROCESS_MODE_ALWAYS
		homeObject.position = Vector2i(416, 216)
		add_child(homeObject)
	homeObject.visible = true


	
