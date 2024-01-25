extends Area2D

var isHit = false

func is_hit():
	return isHit


func set_is_hit(value):
	isHit = value


func _on_body_entered(body):
	if body.is_in_group("projectile"):
		set_is_hit(true)


func _on_area_entered(area):
	if area.is_in_group("projectile"):
		set_is_hit(true)
