extends KinematicBody2D

export (int) var speed = 400
var velocity = Vector2() # set initially

func _ready():
	is_physics_processing()
	pass
	
func _input(event):
	velocity = Vector2() # constantly read
	if Input.is_key_pressed(KEY_DOWN):
		velocity.y += 1
	elif Input.is_key_pressed(KEY_UP):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
	
func _physics_process(delta):
	move_and_slide(velocity)