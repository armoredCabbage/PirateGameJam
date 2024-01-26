extends CanvasLayer

signal retryLevel


func _on_quit_button_pressed():
	get_tree().quit()


func _on_retry_button_pressed():
	#get_tree().change_scene_to_file("res://levels/" + owner.name + ".tscn")
	emit_signal("retryLevel")
