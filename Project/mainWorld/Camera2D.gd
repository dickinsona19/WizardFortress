extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = get_node("/root/MainWorld/Player").position
	
	if Input.is_action_just_pressed("attack"):
		var potion = load("res://Project/potion/potion.tscn")
		var instancedPotion = potion.instance()
		instancedPotion.position = Vector2(0,0)
