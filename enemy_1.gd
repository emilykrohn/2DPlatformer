extends RigidBody2D

var damage_player := false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if damage_player and get_node("../Player").can_take_damage:
		get_node("../Player").damage_player(1)
		get_node("../Player").delay_damage()


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		damage_player = true


func _on_area_2d_body_exited(body):
	if body.name == "Player":
		damage_player = false
