extends Node

func _physics_process(delta):
	const move_speed := 50.0
	$Path2D/PathFollow2D.progress += move_speed * delta
