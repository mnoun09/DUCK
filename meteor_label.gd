extends Node2D

@onready var my_label: Label = $Label
@onready var my_button: Button = $Button
@onready var meteor = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	my_label.add_theme_font_size_override("font_size", 25)
	my_label.text = "Watch out for objects falling from the sky!"
	my_button.hide()
	await get_tree().create_timer(1.5).timeout
	my_label.add_theme_font_size_override("font_size", 30)
	my_label.text = "Meteor incoming!!!"
	meteor.scoring()
	meteor.generate_meteor()
	pass 
	
func meteor_hit() -> void:
	my_label.text = "ouch.."
