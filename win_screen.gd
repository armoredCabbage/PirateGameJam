extends CanvasLayer

signal goToNextLevel

func _on_next_button_pressed():
	emit_signal("goToNextLevel")


func _on_quit_button_pressed():
	get_tree().quit()
