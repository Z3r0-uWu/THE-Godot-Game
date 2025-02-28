extends CharacterBody2D

class_name Player

#Speed stuff
const SPEED = 400.0
const JUMP_VELOCITY = -1000.0

#will cahnge when they can double jump
var double_jump = 0

#Past velocity.y
var past_velocity_y = 0

#Time to give the punch a actual punch
var punch_time = 0

#(7900,1600) for entrance to game
#(1900,175) for room 1
#(1800, 300) for room 2
#(10350,3975) for town
#(500,200) Testing Rooom
	
func _ready():
	if Global.xcode == 0 && Global.ycode == 0:
		self.global_position = Vector2(10350,3975)
	else:
		#Sets where you are after going through doors
		self.global_position = Vector2(Global.xcode,Global.ycode)
	
	#When starting the game or enter room, you wont see your punch
	$Sprite2D/Punch/Punch.disabled = true
	$Sprite2D/Punch.visible = false
	
	
	#Sets how much the punch does
	if Global.upgrade_punch == 0:
		Global.punch_damage = 3

func _physics_process(delta: float) -> void:

	#MC falling
	if (velocity.y > 1500): #need to fix this!
		$Sprite2D.play("falling")
		
	#When velocity.y excedes a certain speed, set the past one
	if(velocity.y > 1900): #to fix this!
		past_velocity_y = velocity.y
		
	#When MC lands on the ground and they fell from a high ground, hurt them /j
	if(velocity.y == 0 && past_velocity_y > 1900):
		#print("OUCH")
		await get_tree().create_timer(1).timeout
		past_velocity_y = 0
		
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	#Running Sprite
	if ((velocity.y < 0 || velocity.y == 0) && (velocity.x > 1 || velocity.x < -1)):
		$Sprite2D.play("Walking")
	else:
		#Becomes idle if player isnt running or falling
		if(velocity.y < 0 || velocity.y == 0):
			pass
			#$Sprite2D.play("Idle")
		
	##Interacting with lore and npc's
	#if Input.is_action_just_pressed("Interact"):
		#DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/Main.dialogue"), "start")
		#return
		
	# Handle jump.
	if Input.is_action_just_pressed("Jump") and (is_on_floor() or double_jump >= 1):
		velocity.y = JUMP_VELOCITY
		double_jump -= 1
	
	#Reseting double jump, will change when they can double jump
	if is_on_floor():
		double_jump = 2
		
	#Moving Var
	var direction := Input.get_axis("Left", "Right")

	if Global.talking == false:
		#Moving left and right and facing those Directions
		if Input.is_action_pressed("Right"):
			transform.x.x = 1
			velocity.x = direction * SPEED	
		if Input.is_action_pressed("Left"):
			transform.x.x = -1
			velocity.x = direction * SPEED	
		else:
			velocity.x = move_toward(velocity.x, 0, 15)
		move_and_slide()
	
	#Punching, will change when get more weapons
	if Input.is_action_just_pressed("Attack") && Global.talking == false:

		$Sprite2D/Punch/Punch.disabled = false
		#$Sprite2D.play("punching")
		$Sprite2D.play("punching")
		#await get_tree().create_timer(5).timeout
		$Sprite2D/Punch/Punch.disabled = true
