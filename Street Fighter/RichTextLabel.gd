extends RichTextLabel
var segons = 60
var milisegons = 0
func _process(delta):
	
	if milisegons > 9:
		segons -= 1
		milisegons = 0
	set_text(str(segons))
	pass


func _on_Timer_timeout():
	milisegons += 1