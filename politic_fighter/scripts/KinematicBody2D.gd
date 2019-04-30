extends KinematicBody2D

var velocitat = Vector2()
export var gravetat = Vector2(0,2.8)
var velocitat_maxima = 200
var saltar = Vector2(0,-400)
var pegant = false

func _ready():
	pass
	
func _process(delta):
	mou()
	anima()
	
func mou():
	#posar += si es vol que les dos tecles vagin a lhora i vagi en diagonal
	velocitat.x = 0
	if Input.is_action_pressed('ui_right'):
		velocitat.x = velocitat_maxima
	if Input.is_action_pressed('ui_left'):
		velocitat.x = -velocitat_maxima
	if Input.is_action_pressed('ui_up') and is_on_floor():
		velocitat += saltar
	if not is_on_floor():
		velocitat += gravetat
	velocitat = move_and_slide(velocitat,Vector2(0,-1))
	
func anima():
	
	if velocitat.y < 0:
		$AnimatedSprite.animation = 'puja_salt'
	if velocitat.y > 0:
		$AnimatedSprite.animation = "baixa_salt"
	if $RayCast2D.is_colliding():
		$AnimatedSprite.animation = "acaba_salt"
	
	if velocitat.x < 0:
		$AnimatedSprite.flip_h = true
	if velocitat.x > 0:
		$AnimatedSprite.flip_h = false
	
	if not pegant:
		if velocitat.x < 0 and is_on_floor():
			$AnimatedSprite.animation = "camina"
		elif velocitat.x > 0 and is_on_floor():
			$AnimatedSprite.animation = "camina"
		elif velocitat.x == 0 and is_on_floor():
			$AnimatedSprite.animation = "quiet"
	
	if Input.is_action_pressed("ui_accept") and is_on_floor():
		$AnimatedSprite.scale.x = 2.25
		$AnimatedSprite.scale.y = 2.4
		$AnimatedSprite.animation = "pega_esq"
		pegant = true
	
	if Input.is_action_pressed("kamikami") and is_on_floor():
		$AnimatedSprite.scale.x = 2.25
		$AnimatedSprite.scale.y = 2.4
		$AnimatedSprite.animation = "kamikami"
		pegant = true
		
	print($AnimatedSprite.animation)
	
	

func _on_AnimatedSprite_animation_finished():
	pegant = false
	$AnimatedSprite.scale.x = 1
	$AnimatedSprite.scale.y = 1
