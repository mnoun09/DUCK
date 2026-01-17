extends TextureButton
var settingText = preload("res://settingsLabel.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pressed() -> void:
	var label
	label = settingText.instantiate()
	add_child(label)
	print ("settings pressed!")
	pass # Replace with function body.
