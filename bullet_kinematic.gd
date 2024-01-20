extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0
var directionSet = true


func _physics_process(delta):
	if directionSet:
		velocity = transform.x * SPEED
		directionSet = false
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())


func _on_timer_timeout():
	queue_free()
