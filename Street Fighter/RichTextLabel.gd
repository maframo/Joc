extends RichTextLabel
var segons = 60
var milisegons = 0
func _process(delta):
	
	if milisegons > 9:
		if segons != 0:
			segons -= 1
			milisegons = 0
		else:
			get_tree().change_scene('res://Scenes/Cepeda.tscn')
	set_text(str(segons))
	pass


func _on_Timer_timeout():
	milisegons += 1