extends Node2D

signal gameOver
var numOfPotions
var charSpeed =2
# Called when the node enters the scene tree for the first time.
func _ready():
	numOfPotions = 10


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("move_left"):
		position.x -= charSpeed
	
	if Input.is_action_pressed("move_right"):
		position.x +=charSpeed
	
	if Input.is_action_pressed("move_up"):
		position.y -=charSpeed
	if Input.is_action_pressed("move_down"):
		position.y +=charSpeed
	
	if Input.is_action_just_pressed("attack") and numOfPotions >0:
		var potion = load("res://Project/potion/potion.tscn")
		var instancedPotion = potion.instance()
		instancedPotion.position = get_global_mouse_position()
		get_parent().add_child(instancedPotion)
		numOfPotions -= 1
		
		


func _on_Area2D_area_entered(area):
	if area.get_groups() != null:
		if area.get_groups()[0]== "enemy":
			emit_signal("gameOver")
