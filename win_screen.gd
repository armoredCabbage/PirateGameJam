extends CanvasLayer

signal goToNextLevel

# Called when the node enters the scene tree for the first time.
func _ready():
	#$NextButton.connect("button_down", toNextLevel)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_next_button_pressed():
	emit_signal("goToNextLevel")
