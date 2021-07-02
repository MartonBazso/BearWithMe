extends Control

signal onResumePressed
signal onNextGamePressed
signal onRestartPressed
signal onTitleScreenPressed


func _ready():
	pass


func _on_TitleScreenButton_pressed():
	emit_signal("onTitleScreenPressed")


func _on_RestartButton_pressed():
	emit_signal("onRestartPressed")


func _on_ResumeButton_pressed():
	emit_signal("onResumePressed")


func _on_NextGameButton_pressed():
	emit_signal("onNextGamePressed")
	

func _on_MusicButton_toggled(button_pressed):
	globals.isVolumeOn = button_pressed
