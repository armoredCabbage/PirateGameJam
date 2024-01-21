extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func spawnResonate():
	var resonate = preload("res://resonate.tscn").instantiate()
	var resonateTimer = resonate.get_child(1)
	resonate.position = $SpawnResonate.global_position
	
	owner.add_child(resonate)
	
	resonateTimer.set_wait_time(3)
	resonateTimer.start()
	
