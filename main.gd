extends Node

func _physics_process(delta):
	const move_speed := 50.0
	$Enemy1Path/PathFollow2D.progress += move_speed * delta
	$FlyingEnemy1Path/PathFollow2D.progress += move_speed * delta
	$FlyingEnemy2Path/PathFollow2D.progress += move_speed * delta
	$FlyingEnemy3Path/PathFollow2D.progress += move_speed * delta
