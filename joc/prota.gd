extends Sprite

var velocitat = Vector2(0,0)
export var velocitat_max = 300

func _ready():
	position = Vector2(700,100)
	
func _physics_process(delta):
	#delta es el temps
	#si poses la posicio al principi i la velocitat al final flota
	velocitat = Vector2(0,0)
	
	if Input.is_action_pressed('ui_up'):
		velocitat += Vector2(0,-120)
	if Input.is_action_pressed('ui_down'):
		velocitat += Vector2(0,120)
	if Input.is_action_pressed('ui_left'):
		velocitat += Vector2(-120,0)
	if Input.is_action_pressed('ui_right'):
		velocitat += Vector2(120,0)
	velocitat = velocitat.normalized() * velocitat_max
	position = position + velocitat * delta
	if Input.is_action_pressed('gira'):
		rotation_degrees += 200 * delta
