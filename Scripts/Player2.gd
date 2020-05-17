extends KinematicBody2D

var speed = globals.speed
var dir = ""
var velocity = Vector2()
var pressed = false

func _ready():
	$Sprite.frame = 0
	
	
	

func _physics_process(delta):
	var velocity = Vector2()
	if (dir == 'r'):
		velocity.x += 10
	if (dir == 'l'):
		velocity.x -= 10
	if (dir == 'd'):
		velocity.y += 10
	if (dir == 'u'):
		velocity.y -= 10
	
	velocity = velocity.normalized() * speed
	var collide = move_and_collide(velocity)
	if(collide != null && dir != ""):
		if dir == "d":
			$Sprite.frame = 3
		elif dir == "u":
			$Sprite.frame = 5
		else:
			$Sprite.frame = 0
		dir = ""

			
func _restoreAnimation():
	if dir=="":
		$Sprite.frame = 0;
	
func _input(event):
	var swipeDir = Vector2()
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		pressed = event.pressed
	if event is InputEventMouseMotion:
		if pressed:
			swipeDir = directionHelper(event.get_speed())
			
	if((event.is_action("PLAYER_UP") || (swipeDir.x == 0 && swipeDir.y == -1) ) && dir != 'r' && dir != 'l' && dir != 'd'):
		dir = "u"
		$Sprite.frame = 4
	if((event.is_action("PLAYER_DOWN") || (swipeDir.x == 0 && swipeDir.y == 1) ) && dir != 'r' && dir != 'l' && dir != 'u'):
		
		dir = "d"
		$Sprite.frame = 2
	if((event.is_action("PLAYER_LEFT") || (swipeDir.x == -1 && swipeDir.y == 0) ) && dir != 'u' && dir != 'd' && dir != 'r'):
		dir = "l"
		if $Sprite.transform.x.x > 0:
			$Sprite.transform.x.x *= -1
		$Sprite.frame = 1
	if((event.is_action("PLAYER_RIGHT") || (swipeDir.x == 1 && swipeDir.y == 0) ) && dir != 'u' && dir != 'd' && dir != 'l'):
		dir = "r"
		if $Sprite.transform.x.x < 0:
			$Sprite.transform.x.x *= -1
		$Sprite.frame = 1
	
	
func directionHelper(vector):
	var finalVector = Vector2()
	
	if (abs(vector.y) > abs(vector.x) ): 
		if(vector.y > 0):
			finalVector = Vector2(0,1)
		if(vector.y < 0):
			finalVector = Vector2(0,-1)
	if (abs(vector.y) < abs(vector.x) ): 
		if(vector.x > 0):
			finalVector = Vector2(1,0)
		if(vector.x < 0):
			finalVector = Vector2(-1,0)
	return finalVector
