extends CharacterBody2D

#How fast Never walks
var SPEED = 5

#To remember the speed
var rem_speed = 0

#the player can talk to him
var talk = 0

func _ready():
	self.global_position = Vector2(1000,3995)
	transform.x.x = -1
	$Arrow.visible = false

#Makes the player able to talk to them
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		talk = 1
		$Arrow.visible = true
		
#Makes the player not able to talk to them
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player:
		talk = 0
		$Arrow.visible = false

#Moves Never back and forth
func _physics_process(_delta: float) -> void:
	position.x += SPEED
	
	if SPEED == 5 || SPEED == -5:
		rem_speed = SPEED
		
	if position.x >= (1000 + 8500):
		SPEED = -5
		transform.x.x = 1
		
	if position.x < (1000-50):
		SPEED = 5
		transform.x.x = -1
	
	#To check if the player is inside npc and has hit the interact buttons
	if (talk == 1 && Input.is_action_just_pressed("Interact") && Global.able_talking == true):		
		SPEED = 0
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/Main.dialogue"), "start")

	#To set Never back in motion
	if Global.Never_talking == true:
		
		#Sets Never to go back to the way he was going
		if rem_speed == 5:
			SPEED = 5
		if rem_speed == -5:
			SPEED = -5
			
		Global.Never_talking = false
