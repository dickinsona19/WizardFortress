extends Node2D


var canBuyPotions = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var numPotions = $Player.numOfPotions
	$HUD/CanvasLayer/numPotions.text = " X " + str(numPotions)
	processBuyingPotions()


func _on_Area2D_area_entered(area):
	if area.get_groups()[0] == "player":
		canBuyPotions = true
	


func _on_Area2D_area_exited(area):
	if area.get_groups()[0] == "player":
		canBuyPotions = false

func processBuyingPotions():
	$HUD/CanvasLayer/refillPotions.visible = false
	if canBuyPotions:
		$HUD/CanvasLayer/refillPotions.visible = true
		if Input.is_action_just_pressed("refill"):
			$Player.numOfPotions = 10


func _on_EnemySpawner_timeout():
	var enemy = load("res://Project/Enemy/Enemy.tscn")
	var instancedEnemy = enemy.instance()
	instancedEnemy.position = Vector2(600,220)
	add_child(instancedEnemy)
