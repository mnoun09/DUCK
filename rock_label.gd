extends Node2D
@onready var my_label: Label = $Label
@onready var my_button: Button = $Button
@onready var rock = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	my_label.add_theme_font_size_override("font_size", 30)
	my_label.text = "Not yet.. don't get flattened!"
	my_button.hide()
	await get_tree().create_timer(2).timeout
	rock.spawning_rock()
	rock.scoring()
	pass # Replace with function body.
