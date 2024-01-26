extends CharacterBody2D

var cooldown = 1
var seconds = 0
signal hitTarget

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#if cooldown > 0:
		#cooldown -= delta
	#else:
		#cooldown = 1
		#if seconds != 3:
			#seconds += 1
			#$CollisionShape2D.scale *= 1.5
		#else:
			#queue_free()


func _physics_process(delta):
	if cooldown > 0:
		cooldown -= delta
	else:
		cooldown = 1
		if seconds != 2:
			seconds += 1
			$CollisionShape2D.shape.radius *= 1.5
			$Sprite2D.scale *= 1.5
			#scale *= 1.5
		else:
			queue_free()


#func _on_timer_timeout():
	#queue_free()
