extends RigidBody2D

func _ready():
	friction = 0;
	bounce = 1;
	reset_state = true
	pass
	
var reset_state = false
var point_to = 0
	
func _process(delta):
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.name == "p1_goal":
			point_to = 2
			reset_state = true
		if body.name == "p2_goal":
			point_to = 1
			reset_state = true
			
func _integrate_forces(state):
	if reset_state:
		var x = int(get_viewport().size.x / 2)
		var y = int(get_viewport().size.y / 2)
		state.transform = Transform2D(0.0, Vector2(x, y))
		reset_state = false
		if point_to == 1:
			global.player1_score += 1
			get_node("../p1_score").text = str(global.player1_score)
			if global.player2_score == 11:
				get_node("../win_text").text = "PLAYER 1 WINS!"
				get_node("../restart_game").show()
				get_node("../win_text").show()
				get_tree().paused = true
		if point_to == 2:
			global.player2_score += 1
			get_node("../p2_score").text = str(global.player2_score)
			if global.player2_score == 11:
				get_node("../win_text").text = "PLAYER 2 WINS!"
				get_node("../restart_game").show()
				get_node("../win_text").show()
				get_tree().paused = true
		point_to = 0