extends Node2D

const TRANS = Tween.TRANS_SINE
const EASE = Tween.EASE_IN_OUT

var amplitude = 0
onready var camera = get_parent()

func start(duration = 0.2, frequency = 8, amplitude = 3):
	if not globals.screen_shake:
		return
	self.amplitude = amplitude
	$Duration.wait_time = duration
	$Timer.wait_time = 1/float(frequency)
	$Duration.start()
	$Timer.start()

	_new_shake()

func _new_shake():
	var rand = Vector2()
	rand.x = rand_range(-amplitude, amplitude)
	rand.y = rand_range(-amplitude, amplitude)
	$Tween.interpolate_property(camera, "offset", camera.offset, rand, $Timer.wait_time, TRANS, EASE)
	$Tween.start()

func _reset():
	$Tween.interpolate_property(camera, "offset", camera.offset, Vector2(), $Timer.wait_time, TRANS, EASE)
	$Tween.start()

func _on_Timer_timeout():
	_new_shake()


func _on_Duration_timeout():
	_reset()
	$Timer.stop()
