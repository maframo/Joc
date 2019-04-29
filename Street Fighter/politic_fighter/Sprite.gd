extends Sprite

var velocitat = Vector2(0,0)

func _ready():
	position = Vector2(700,100)

func _physics_process(delta):
	#delta es el temps
	position = position + velocitat * delta
	