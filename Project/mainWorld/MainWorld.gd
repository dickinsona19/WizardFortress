extends Node2D


var canBuyPotions = false
var score

# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var numPotions = $Player.numOfPotions
	$HUD/CanvasLayer/numPotions.text = " X " + str(numPotions)
	processBuyingPotions()
	$HUD/CanvasLayer/score.text = "Score:  "+ str(score)
	$HUD/CanvasLayer/coinsLabel.text = "Coins: " + str($Player.playerCoins)


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
		if Input.is_action_just_pressed("refill") and $Player.playerCoins > 0:
			$Player.numOfPotions = 10
			$Player.playerCoins -= 1


func _on_EnemySpawner_timeout():
	var randX
	var randY
	var randPosition = randi() %4
	
	
	if randPosition == 0:
		 randX = $Player.position.x + (randi() %101 + 50) 
		 randY = $Player.position.y + (randi() %101 + 50) 
		
	if randPosition == 1:
		 randX = $Player.position.x - (randi() %101 + 50) 
		 randY = $Player.position.y - (randi() %101 + 50) 
		
	if randPosition == 2:
		 randX = $Player.position.x - (randi() %101 + 50) 
		 randY = $Player.position.y + (randi() %101 + 50) 
		
	if randPosition == 3:
		 randX = $Player.position.x + (randi() %101 + 50) 
		 randY = $Player.position.y - (randi() %101 + 50) 
	
	
	
	var enemy = load("res://Project/Enemy/Enemy.tscn")
	var instancedEnemy = enemy.instance()
	instancedEnemy.position = Vector2(randX,randY)
	add_child(instancedEnemy)
	score += 1


func _on_Player_gameOver():
	$HUD/CanvasLayer/Gameover.visible = true
	$Player/Area2D/CollisionShape2D.queue_free()
	$EnemySpawner.queue_free()
	$HUD/CanvasLayer/Replay.visible = true
