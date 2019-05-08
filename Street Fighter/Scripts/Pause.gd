extends Control

func _input(event):
	if event.is_action_pressed("Pause"):
		canvia_pausa()
		
func canvia_pausa():
	var pausa_nova = not get_tree().paused
	get_tree().paused = pausa_nova
	visible = pausa_nova

func _on_Resume_pressed():
	canvia_pausa()
