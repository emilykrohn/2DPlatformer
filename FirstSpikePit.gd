extends Area2D

var can_damage := false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_damage == true and get_node("../Player").can_take_damage:
		get_node("../Player").damage_player(1)
		get_node("../Player").delay_damage()


func _on_body_entered(body):
	if body.name == "Player":
		can_damage = true
		await get_tree().create_timer(0.1).timeout
		body.global_position = Vector2(375, -38)


func _on_body_exited(body):
	if body.name == "Player":
		can_damage = false
