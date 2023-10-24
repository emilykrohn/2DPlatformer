extends Node

var enemy_paths
func _physics_process(delta):
	const move_speed := 50.0
	enemy_paths = get_tree().get_nodes_in_group("EnemyPaths")
	for enemy in enemy_paths:
		enemy.get_node("PathFollow2D").progress += move_speed * delta
	#$Enemy1Path/PathFollow2D.progress += move_speed * delta
	#$FlyingEnemy1Path/PathFollow2D.progress += move_speed * delta
	#$FlyingEnemy2Path/PathFollow2D.progress += move_speed * delta
	#$FlyingEnemy3Path/PathFollow2D.progress += move_speed * delta
