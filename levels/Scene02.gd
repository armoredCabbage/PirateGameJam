extends Node

var time_elapsed = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	$WinScreen.visible = false
	$PlayerCharacter.position = $StartPosition.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("fire"):
		if time_elapsed > 4.9:
			time_elapsed = 0.0
			$Seconds.text = 0
		
		$Seconds.text = str(time_elapsed)
		time_elapsed += delta
	if Input.is_action_just_released("fire"):
		$PlayerCharacter._shoot(time_elapsed)
		time_elapsed = 0.0
		$Seconds.text = "0"


func _unhandled_input(event):
	var time = get_process_delta_time()
	if Input.is_action_pressed("fire"):
		$Label.text = "Charging"



