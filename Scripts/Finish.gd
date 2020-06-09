extends Node2D

signal body_entered

func _ready():
	pass

func _on_Area2D_body_entered(body):
	emit_signal("body_entered")
