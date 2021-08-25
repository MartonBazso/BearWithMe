class_name Player
extends KinematicBody2D


func _ready():
	pass

func defeat():
	print("I'm dead XDDDDDDDD")
	$StateMachine._change_state("lose")
