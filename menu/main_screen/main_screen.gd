extends Control

onready var tween = get_node("Tween")

onready var window_width = ProjectSettings.get_setting("display/window/size/width")
onready var window_height = ProjectSettings.get_setting("display/window/size/height")

onready var current_pos = Vector2(window_width/2, window_height/2)
var lower_limit = -0
var upper_limit = 0

var input_active = false

func _ready():
	lower_limit = $MenuItems.get_children().front().get_position().x/2
	var last = $MenuItems.get_children().back()
	upper_limit =  last.get_position().x + last.rect_size.x/2
	for c in $MenuItems.get_children():
		if c is Control:
			pass#c.height


func _input(event):
	if $MenuItems/SettingsPage.is_gui_active or not (event is InputEventMultiScreenDrag or
	event is InputEventSingleScreenDrag or
	event is InputEventJoypadMotion or
	(event is InputEventMouseMotion and Input.is_mouse_button_pressed(BUTTON_LEFT))):
		return
	$Timer.start()
	var new_pos = Vector2(current_pos.x - event.relative.x*1.5, current_pos.y)
	if new_pos.x > upper_limit or new_pos.x < lower_limit:
		return
	$Camera2D.set_position(new_pos)
	current_pos = new_pos



func snap_to_closest_center():
	var closest_center = get_closest_center_to_current_pos()
	tween.interpolate_property($Camera2D, "position",
	current_pos, closest_center, 0.3,
	Tween.TRANS_BACK, Tween.EASE_IN_OUT)
	current_pos = closest_center
	tween.start()


func _on_Timer_timeout():
	snap_to_closest_center()


func get_closest_center_to_current_pos():
	var closest = Vector2()
	var min_dist = 999999999999
	for c in $MenuItems.get_children():
		var center = c.get_position() + c.rect_size/2
		var current_dist = current_pos.distance_to(center)
		if current_dist < min_dist:
			closest = center
			min_dist = current_dist
	return closest
