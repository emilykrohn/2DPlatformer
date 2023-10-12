extends Node

const CLIMB_SPEED = 5
var can_climb := false

func _physics_process(delta):
	if Input.is_action_pressed("ui_up") and can_climb:
		get_node("../Player").global_position += Vector2.UP * CLIMB_SPEED
	if Input.is_action_pressed("ui_down") and can_climb:
		get_node("../Player").global_position += Vector2.DOWN * CLIMB_SPEED

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		print("entered")
		can_climb = true

func _on_area_2d_body_exited(body):
	if body.name == "Player":
		print("exited")
		can_climb = false
