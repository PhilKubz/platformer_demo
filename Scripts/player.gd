extends CharacterBody2D

class_name Player

@export var gravity = 350
@export var speed = 3
@export var jump_force = 150

@onready var sprite = $Sprite2D

func _physics_process(delta):
	if is_on_floor() == false:
		velocity.y += gravity * delta
		
	var direction = 0
	if Input.is_action_just_pressed("jump") && is_on_floor():
		jump(jump_force)
		
	direction = Input.get_axis("move_left", "move_right")
	if direction != 0:
		sprite.flip_h = (direction == -1)
		
	velocity.x += speed
	if velocity .x > 500:
		velocity.x = 500
	move_and_slide()



func jump(force):
	velocity.y = -force
