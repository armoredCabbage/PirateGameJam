extends Node

var time_elapsed = 0.0
var chargeBar
var targets
var targetHit

# Called when the node enters the scene tree for the first time.
func _ready():
	
	chargeBar = $ChargeBar.get_child(1)
	$WinScreen.visible = false
	
	$PlayerCharacter.position = $StartPosition.position
	$PlayerCharacterSprite.position = $StartPosition.position
	
	$ChargeBar.position = $ChargeBarStartPosition.position
	
	$Target.position = $TargetPosition.position
	$Enemy.position = $EnemyPosition.position
	targets = get_tree().get_nodes_in_group("targets")
	print(targets.size())
	print(getTotalHitTargets(targets))
	
	$WinScreen.connect("goToNextLevel", transitionToNextLevel)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("fire"):
		if time_elapsed > 2:
			time_elapsed = 0.0
			#$Seconds.text = "0"
		
		#$Seconds.text = str(time_elapsed)
		time_elapsed += delta
		
		chargeBar.scale = Vector2(time_elapsed/2, 1)
	if Input.is_action_just_released("fire"):
		$PlayerCharacter._shoot(time_elapsed)
		time_elapsed = 0.0
		#$Seconds.text = "0"
		
		chargeBar.scale = Vector2(0, 1)
	
	


func _unhandled_input(event):
	var time = get_process_delta_time()
	var NextButton = $WinScreen/NextButton
	
	#if Input.is_action_pressed("fire"):
		#$Label.text = "Charging"


func transitionToNextLevel():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://levels/Level02.tscn")


func _on_target_body_entered(body):
	if body.is_in_group("projectile"):
		if getTotalHitTargets(targets) == targets.size():
			winningScreen(body)
	#print(getTotalHitTargets(targets))


func _on_target_area_entered(area):
	if area.is_in_group("resonateWave"):
		winningScreen(area)


func winningScreen(object):
	#if object.is_in_group("targets"):
		#object.queue_free()
	get_tree().paused = true
	$WinScreen.visible = true


func getTotalHitTargets(targets):
	var totalTargets = targets.size()
	var totalHitTargets = 0
	for target in targets:
		if target.is_hit():
			totalHitTargets += 1
	
	return totalHitTargets
