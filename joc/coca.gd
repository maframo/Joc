extends Sprite

var velocitat = Vector2(0,0)
export var velocitat_max = 300

func _ready():
	position = Vector2(700,100)

func _physics_process(delta):
	velocitat = Vector2(0,0)
	
	if Input.is_action_pressed('up_p2'):
		velocitat += Vector2(0,-120)
	if Input.is_action_pressed('down_p2'):
		velocitat += Vector2(0,120)
	if Input.is_action_pressed('left_p2'):
		velocitat += Vector2(-120,0)
	if Input.is_action_pressed('right_p2'):
		velocitat += Vector2(120,0)
	velocitat = velocitat.normalized() * velocitat_max
	position = position + velocitat * delta
	if Input.is_action_pressed('gira'):
		rotation_degrees += 200 * delta

	if Input.is_action_pressed('gira_left'):
		rotation_degrees += -200 * delta
	if Input.is_action_pressed('gira_right'):
		rotation_degrees += 200 * delta
	