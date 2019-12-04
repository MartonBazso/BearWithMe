extends Control
export(int) var type = 0

signal onResumePressed
signal onNextGamePressed
signal onRestartPressed
signal onTitleScreenPressed


func _ready():
	if type == 0 : 
		$VSeparation/Resume.visible = true
		$VSeparation/NextGame.visible = false
	elif type == 1:
		$VSeparation/NextGame.visible = true
		$VSeparation/Resume.visible = false


func _on_TitleScreenButton_pressed():
	emit_signal("onTitleScreenPressed")


func _on_RestartButton_pressed():
	emit_signal("onRestartPressed")


func _on_ResumeButton_pressed():
	emit_signal("onResumePressed")


func _on_NextGameButton_pressed():
	emit_signal("onNextGamePressed")
