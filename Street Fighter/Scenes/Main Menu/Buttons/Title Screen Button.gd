extends Button

func _on_Title_Screen_pressed():
	get_tree().change_scene('res://Scenes/Main Menu/Main Menu.tscn')
	get_tree().paused = false 
	
