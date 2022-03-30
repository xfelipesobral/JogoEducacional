extends KinematicBody2D

var filha_negra_sprite = preload("res://recursos/personagem/filha_negra.png")
var filha_branca_sprite = preload("res://recursos/personagem/filha_branca.png")
var filho_negro_sprite = preload("res://recursos/personagem/filho_negro.png")
var filho_branco_sprite = preload("res://recursos/personagem/filho_branco.png")

var animationTree
var animationState
var player_sprite

func _ready():
	animationTree = $AnimationTree
	animationState = animationTree.get('parameters/playback')
	player_sprite = get_node("Sprite")
	switch_texture(5)

func switch_texture(sprite_number):
	if(sprite_number == 1):
		player_sprite.set_texture(filha_negra_sprite)
	elif(sprite_number == 2):
		player_sprite.set_texture(filha_branca_sprite)
	elif(sprite_number == 3):
		player_sprite.set_texture(filho_negro_sprite)
	else:
		player_sprite.set_texture(filho_branco_sprite)

func _toggled(button_pressed):
	switch_texture(button_pressed)

func _physics_process(delta):
	var movement = Vector2.ZERO
	
	movement.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	movement.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	
	if(movement == Vector2.ZERO):
		animationState.travel('Idle')
	else :
		animationState.travel('Move')
		animationTree.set('parameters/Move/blend_position', movement)
		animationTree.set('parameters/Idle/blend_position', movement)
	
	move_and_slide(movement.normalized() * 100)

