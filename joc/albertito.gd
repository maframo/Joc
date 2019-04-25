extends Sprite

var velocitat = Vector2(0,0)
export var velocitat_max = 300

func _ready():
	position = Vector2(200,100)

func _physics_process(delta):
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
	if Input.is_action_pressed('gira_left'):
		rotation_degrees += -200 * delta
	if Input.is_action_pressed('gira_right'):
		rotation_degrees += 200 * delta
	
	"""
	if get_slide_collision(get_slide_count()-1) != null:
		var objecte_xoc = get_slide_collision(get_slide_count()-1).collider
		if objecte_xoc.is_in_group("objecte"):
		"""	