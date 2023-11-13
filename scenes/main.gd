## File:	main.gd
## Main scene script. Spawn player and will later allow scene management.
##
## Author:	Benjamin Borello
## Created: 26/10/2023
##
## Main scene's script
## It's only goal is to show how to get object (player)
## and add it to scene through code.
extends Node2D

var player_scene: PackedScene = preload("res://scenes/player/player.tscn")

@onready var player_spawn: Node2D = $PlayerSpawn


func _ready() -> void:
	Global.main = self
	_spawn_player()


func _spawn_player() -> void:
	var player: Player = player_scene.instantiate()
	player.position = player_spawn.position
	add_child(player)
