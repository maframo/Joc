extends KinematicBody2D

var velocitat = Vector2()
export var gravetat = Vector2(0,10.8)
var velocitat_maxima = 200
var saltar = Vector2(0,-550)
var pegant = false
var pot_disparar = true
var mirant_dreta = true
var escena_bola = preload("res://Scenes/Game/Extras/Kamikami.tscn")

func _ready():
	pass

func _process(delta):
	mou()
	anima()

func mou():
	#posar += si es vol que les dos tecles vagin a lhora i vagi en diagonal
	velocitat.x = 0
	if Input.is_action_pressed('ui_right') and not Input.is_action_pressed('ui_select'):
		velocitat.x = velocitat_maxima
	if Input.is_action_pressed('ui_left') and not Input.is_action_pressed('ui_select'):
		velocitat.x = -velocitat_maxima
	if Input.is_action_pressed('ui_up') and is_on_floor():
		velocitat += saltar
	if not is_on_floor():
		velocitat += gravetat
	velocitat = move_and_slide(velocitat,Vector2(0,-1))

func anima():

	if Input.is_action_pressed("voltereta"):
		if velocitat.y < 0:
			$AnimatedSprite.animation = 'voltereta_amunt'
		if velocitat.y > 0:
			$AnimatedSprite.animation = "voltereta_avall"
		if $RayCast2D.is_colliding():
			$AnimatedSprite.animation = "acaba_voltereta"	
	elif velocitat.y != 0 and not is_on_floor():
		if velocitat.y < 0:
			$AnimatedSprite.animation = 'puja_salt'
		if velocitat.y > 0:
			$AnimatedSprite.animation = "baixa_salt"
		if $RayCast2D.is_colliding():
			$AnimatedSprite.animation = "acaba_salt"

	if velocitat.x < 0:
		$AnimatedSprite.flip_h = true
		mirant_dreta = false
	if velocitat.x > 0:
		$AnimatedSprite.flip_h = false
		mirant_dreta = true

	if not pegant:
		if velocitat.x < 0 and is_on_floor():
			$AnimatedSprite.animation = "camina"
		elif velocitat.x > 0 and is_on_floor():
			$AnimatedSprite.animation = "camina"
		elif velocitat.x == 0 and is_on_floor():
			$AnimatedSprite.animation = "quiet"

	if Input.is_action_pressed("pega_dreta") and is_on_floor():
		$AnimatedSprite.animation = "pega_dret"
		pegant = true

	elif Input.is_action_pressed("ui_accept") and is_on_floor():
		$AnimatedSprite.animation = "pega_esq"
		pegant = true

	if Input.is_action_pressed("patada") and is_on_floor():
		$AnimatedSprite.animation = "patada"
		pegant = true

	if Input.is_action_pressed("patada_forta") and is_on_floor():
		$AnimatedSprite.animation = "patada_forta"
		pegant = true

	if pot_disparar:
		if Input.is_action_pressed("KamiKami") and is_on_floor():
			pegant = true
			$AnimatedSprite.animation = "kamikami"

	print($AnimatedSprite.animation)

func kamikami(mirant_dreta):
	pot_disparar = false
	if mirant_dreta == true:
		crea_bala($Position_dreta.global_position)
	else:
		crea_bala($Position_esquerra.global_position)
	$Timer.start()

func crea_bala(posicio):
	var bola_foc = escena_bola.instance()
	bola_foc.position = posicio
	if not mirant_dreta:
		bola_foc.velocitat_bola *= -1
		bola_foc.velocitat_rotacio *= -1
		bola_foc.get_node('Sprite').flip_h = true

	get_tree().get_root().get_node("Joc/Bola").add_child(bola_foc)

func _on_AnimatedSprite_animation_finished():
	pegant = false
	if $AnimatedSprite.animation == 'kamikami':
		kamikami(mirant_dreta)

func _on_Timer_timeout():
	pot_disparar = true
