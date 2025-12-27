extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -750.0
var alive : bool = true

@onready var animated_sprite = $AnimatedSprite2D
@onready var rockScene = $".."
@onready var label = $"../MeteorLabel"

var eggs_list : Array[TextureRect]
var egg = 3 

func _ready() -> void:
	var hearts_parent = $healthBar/HBoxContainer
	for child in hearts_parent.get_children():
		eggs_list.append(child)
	print(eggs_list)	
	
func update_hearts_display():
	for i in range(eggs_list.size()):
		eggs_list[i].visible = i < egg

func _physics_process(delta: float) -> void:
	if is_hit: 
			return
			
	# Add the gravity.
	if not is_on_floor():
			
		animated_sprite.play("Idle")
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		animated_sprite.play("Jump")
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		animated_sprite.play("Run")
		animated_sprite.flip_h = direction < 0
	else:
		animated_sprite.play("Idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
	
var is_hit := false

func on_hit_by_meteor(damage: int):
	if is_hit:
		
		return
		
	is_hit = true
	if egg > 0:
		egg-= 1
		update_hearts_display()
	
	if egg <= 0:
		rockScene.spawn = false
		alive = false
		
	#label.meteor_hit()
	animated_sprite.play("Hurt")
	#update_heart_display()
	print("Playing animation:", animated_sprite.animation)

	await animated_sprite.animation_finished
	
	is_hit = false
	
	print("Playing animation:", animated_sprite.animation)

	animated_sprite.play("Idle")
	
