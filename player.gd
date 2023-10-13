extends CharacterBody2D


const SPEED = 120.0
const JUMP_VELOCITY = -325.0
const ACCELERATION = 400
const FRICTION = 1400

var is_walking := false
var is_jumping := false
var can_take_damage := true

var health := 10

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func delay_damage():
	await get_tree().create_timer(1).timeout
	can_take_damage = true

func damage_player(amount):
	if health > 0:
		health -= amount
		can_take_damage = false

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor() and not get_node("../Ladder").can_climb:
		velocity.y += gravity * delta
		
	if velocity.length() > 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite2D.animation = "jump"

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		$AnimatedSprite2D.flip_h = velocity.x < 0
		velocity.x = move_toward(velocity.x, SPEED * direction, ACCELERATION * delta)
		if is_on_floor():
			$AnimatedSprite2D.animation = "walk"
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
		$AnimatedSprite2D.animation = "stand"
	
	if not is_on_floor():
		$AnimatedSprite2D.animation = "jump"

	move_and_slide()
