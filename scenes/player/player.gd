class_name Player
extends CharacterBody2D

## File:	player/player.gd
##
## Author:	Benjamin Borello
## Created: 26/10/2023
##
## This script is a functional exemple 
## for basics player character movements.

const MAX_SPEED: float = 650.0
const ACCELERATION: float = 0.25
const FRICTION: float = 0.15

@onready var camera: Camera2D = $Camera2D
@onready var timer: Timer = $Timer


func _ready() -> void:
	Global.player = self
	camera.enabled = true


func _physics_process(_delta: float) -> void:
	_movement_handler()


# Handle PC movements and apply Walk aninimation
# use facing direction, acceleration and friction
# @see _get_direction()
func _movement_handler() -> void:
	var direction: Vector2 = _get_direction()
	
	if (direction.length() > 0):
		velocity = lerp(velocity, direction * MAX_SPEED, ACCELERATION)
	else:
		velocity = lerp(velocity, Vector2.ZERO, FRICTION)
	
	move_and_slide() # move_and_slide handle delta time


# Calcul PC facing direction
# Returned direction is normalized
# Direction is compute from action_strength of 4 base axises
func _get_direction() -> Vector2:
	var d := Vector2.ZERO
	
	Input.is_action_pressed("move_down")
	
	d.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	d.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	return d.normalized()
