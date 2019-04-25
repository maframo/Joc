extends KinematicBody2D
var velocity
var speed = 200

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move()
	animate()
	
		

func move():
	velocity = Vector2(0,0)
	if Input.is_action_pressed('ui_right'):
		velocity.x = 1
	if Input.is_action_pressed('ui_left'):
		velocity.x = -1
	velocity *= speed
	velocity = move_and_slide(velocity,Vector2(0,-1))

func direction():
	if velocity.x > 0:
		$Sprite.flip_h = false
	if velocity.x < 0:
		$Sprite.flip_h = true
	
func animate():
#	if Input.is_action_just_pressed('ui_select'):
#		$AnimationPlayer.play("Punch")
#	if velocity.x != 0 and not $AnimationPlayer.is_playing():
#		$AnimationPlayer.play("Walk")
#	if not $AnimationPlayer.is_playing():
#		$AnimationPlayer.play("Still")
	pass
