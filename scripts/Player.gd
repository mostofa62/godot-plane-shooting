extends Node2D

export var speed = 400  # How fast the player will move (pixels/sec).
var screen_size  # Size of the game window.
var currentFrame = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_right"):		        
		velocity.x += 1
		currentFrame = 2		
	if Input.is_action_pressed("ui_left"):
 		velocity.x -= 1
			currentFrame = 0
	if Input.is_action_pressed("ui_down"):
        velocity.y += 1
	if Input.is_action_pressed("ui_up"):
        velocity.y -= 1
		
	if velocity.length() > 0:        
		velocity = velocity.normalized() * speed
	if velocity.x !=0:
		$AnimatedSprite.frame = currentFrame
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.frame = 1
		$AnimatedSprite.stop()
		
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)