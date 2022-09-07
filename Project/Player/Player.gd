extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("move_left"):
		position.x -= 5
	
	if Input.is_action_pressed("move_right"):
		position.x +=5
	
	if Input.is_action_pressed("move_up"):
		position.y -=5
	if Input.is_action_pressed("move_down"):
		position.y +=5
	

