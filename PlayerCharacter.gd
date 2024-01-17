extends Node2D

var time_elapsed = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	rotation = 90

func _get_time_elapsed():
	return time_elapsed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())


func _shoot(timeElapsed):
	
	var projectile = preload("res://bullet.tscn").instantiate()
	var projectileTimer = projectile.get_child(2)
	
	owner.add_child(projectile)
	projectileTimer.set_wait_time(timeElapsed)
	projectileTimer.start()
	
	projectile.transform = $Sprite2D/Muzzle.global_transform
