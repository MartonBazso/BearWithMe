extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var Player = null
var cam = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_Node2D_ready():
	#Player = load("res://Player.tscn").instance()
	#Player.position = Vector2(300,720/2)
	cam = Camera2D.new()
	cam.position.x = 100
	cam.make_current()
	$Player.add_child(cam)
	#add_child(Player)
