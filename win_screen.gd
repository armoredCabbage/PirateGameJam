extends CanvasLayer

signal goToNextLevel


func _on_next_button_pressed():
	emit_signal("goToNextLevel")
