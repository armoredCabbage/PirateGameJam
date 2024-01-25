extends CharacterBody2D

const SPEED = 70.0
const JUMP_VELOCITY = -400.0
var directionSet = true
signal hitTarget


func _physics_process(delta):
	if directionSet:
		velocity = transform.x * SPEED
		directionSet = false
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		
		if collider.is_in_group("blocks"):
			queue_free()
		if collider.is_in_group("echoes"):
			velocity = velocity.bounce(collision.get_normal())
			rotation = velocity.normalized().angle()
		if collider.is_in_group("resonates"):
			collider.resonance(collider)
		if collider.is_in_group("enemies"):
			queue_free()
		if collider.is_in_group("targets"):
			emit_signal("hitTarget")


func _on_timer_timeout():
	queue_free()
