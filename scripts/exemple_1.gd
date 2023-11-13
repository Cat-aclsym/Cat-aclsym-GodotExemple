## File:	exemple_1.gd
## This script is a exemple of code to better understanding code conventions and good practices in GdScript.
##
## Author:	Benjamin Borello
## Created: 26/10/2023
##
## This script is an exemple.
## It's intended usage is to serve as a reference for
## coding style.
class_name Test 
extends Node

signal my_signal

# Enums in PascalCase
enum MyEnum1 {A, B, C}
enum MyEnum2 {
	A,
	B,
	C, # Trailing coma if declaration on multiple line
}

# Consts in MAJ with '_' to separates words
const MY_CONST: int = 69420

# Every others shits goes in snake_case
@export var my_exported_var: String = "Hello World!"
@export_enum("White", "Yellow", "Orange") var my_color: String

var public_var_1: int = 123
var public_var_2: Array[String] = []

var _private_var_1: int = 321
var _private_var_2: int

## Use implicit typing to avoid redondance
var _implicit_type := Vector2(0, 1)	# good
var _redondant_type: Vector2 = Vector2(0, 1) # bad


## Internals functions goes firsts in the call order: 
## cf. https://docs.godotengine.org/en/stable/tutorials/scripting/scene_tree.html#tree-order

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


# Called every frame. 
# '_delta' is the elapsed time since the previous frame.
# in this case the arg start with an '_' because we will not use it in the function
# in ny other case we would remove the '_'
func _process(_delta: float) -> void:
	# Add a '_' to arguments name when you will not use them
	pass


## Then write publics functions

func my_public_function() -> int:
	return public_var_1
	

# Variant is the equivalent of 'any' in javascript
# It is better to avoid as possible to use these type of functions
# If you create a variant function always precise what can be 
#   return in comments before function.
func get_player_if_ready() -> Variant:
	if ( Global.player != null):
		var player_is_ready: bool = false
		# do some verification ...
		if ( player_is_ready ):
			return Global.player
		
	return null

	
## Then write privates functions

func _my_private_function() -> void:
	emit_signal("my_signal") # trigger signal callback
	public_var_1 += 1


func _connect_signal() -> void:
	# Link signal to callback function
	connect("my_signal", _on_Test_my_signal) 
	

func _ternary_exemple() -> int:
	# Ternaris are ok while they stay easy to read and understand
	return 1 if (public_var_1 > 0) else 2
	

# End with signal callback

# Signal callback function are named like:
# _on_<NodeName>_<signal_name>() -> void:
func _on_Test_my_signal() -> void:
	print("my_signal has been trigered")

