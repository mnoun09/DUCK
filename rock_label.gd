extends Node2D
@onready var my_label: Label = $Label
@onready var my_button: Button = $Button
@onready var rock = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	my_button.hide()
	await get_tree().create_timer(2).timeout
	my_button.show()
	my_label.add_theme_font_size_override("font_size", 32)
	my_label.text = "The sky got lighter?"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	my_button.hide()
	my_label.add_theme_font_size_override("font_size", 30)
	my_label.text = "Yes, that must be it!"
	await get_tree().create_timer(3).timeout
	my_label.add_theme_font_size_override("font_size", 26)
	my_label.text = "The star is piecing the sky back together!"
	await get_tree().create_timer(4).timeout
	my_label.add_theme_font_size_override("font_size", 30)
	my_label.text = "There must be more.."
	await get_tree().create_timer(2).timeout
	my_label.text = "Keep collecting them"
	await get_tree().create_timer(2).timeout
	my_label.add_theme_font_size_override("font_size", 25)
	my_label.text = "But watch out, things are still falling"
	rock.spawning_rock()
	rock.scoring()
	pass # Replace with function body.
