extends CanvasLayer

signal onPausePressed
signal onZoomToggled(button_pressed)

func _ready():
	$CurrentMoney.text = str(globals.money)
	
	

func _on_PauseButton_pressed():
	emit_signal("onPausePressed") 


func _on_ZoomButton_toggled(button_pressed):
	emit_signal("onZoomToggled", button_pressed)
