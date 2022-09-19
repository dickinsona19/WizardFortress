extends Node2D
var player

var vector	


# Called when the node enters the scene tree for the first time.
func _ready():
	player =  get_node("/root/MainWorld/Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(player.position)
	var vector = (player.position - global_position).normalized()
	translate(vector)
	



func _on_Area2D_area_entered(area):
	if area.get_groups() != null:
		if area.get_groups()[0] =="potion":
			queue_free()
