extends Area2D

var cooldown = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if cooldown > 0:
		cooldown -= delta
	else:
		cooldown = 1
		scale *= 1.5


func _on_timer_timeout():
	queue_free()
