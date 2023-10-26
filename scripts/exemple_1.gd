class_name Test 
extends Node

## File:	exemple_1.gd
##
## Author:	Benjamin Borello
## Created: 26/10/2023
##
## This script is an exemple.
## It's intended usage is to serve as a reference for
## coding style.

signal my_signal

# Enums in PascalCase
enum MyEnum1 {A, B, C}
enum MyEnum2 {
	A,
	B,
	C, # Trailing coma if declaration on multiple line
}

# Consts in MAJ with _ to separates words
const MY_CONST: int = 69420

# Every others shits goes in snake_case
@export var my_exported_var: String = "Hello World!"

var public_var_1: int = 123
var public_var_2: int

var _private_var_1: int = 321
var _private_var_2: int

# Use implicit typing to avoid redondance
var _implicit_type := Vector2(0, 1)	# good
var _redondant_type: Vector2 = Vector2(0, 1) # bad


# Internals functions goes firsts

# Constructor
func _init() -> void:
	pass


# Called when node enter the root tree for the first time.
func _enter_tree() -> void:
	pass

	
# Called when node enters the scene tree for the first time.
func _ready() -> void:
	# Limits raw codes in internal functions
	# Call functions instead
	_connect_signal()


# Called every frame. '_delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# Add a '_' to arguments name when you will not use them
	pass


# Then write publics functions

func my_public_function() -> int:
	return public_var_1

	
# Then write privates functions

func _my_private_function() -> void:
	emit_signal("my_signal") # trigger signal callback
	public_var_1 += 1


func _connect_signal() -> void:
	connect("my_signal", _on_Test_my_signal) # Link signal to callback function


func _ternary_exemple() -> int:
	# Ternaris are ok while they stay easu to read and understand
	return 1 if (public_var_1 > 0) else 2


# End with signal callback

# Signal callback function are named like:
# 	_on_<NodeName>_<signal_name>() -> void:
func _on_Test_my_signal() -> void:
	print("my_signal has been trigered")
