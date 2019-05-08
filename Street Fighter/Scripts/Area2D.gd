extends Area2D

#export var damage = 10
export var velocitat_bola : int = 150
var velocitat = Vector2(velocitat_bola,0)

#var deteccions = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	velocitat.x = velocitat_bola
	
func _physics_process(delta):
	position += velocitat * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

