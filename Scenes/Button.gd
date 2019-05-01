extends Button
#restart_button

func _ready():
	hide()

func _pressed():
	get_tree().paused = false
	global.player1_score = 0
	global.player2_score = 0
	get_tree().reload_current_scene()