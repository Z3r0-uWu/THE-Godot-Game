extends CharacterBody2D

#the player can talk to him
var talk = 0

func _ready():
	self.global_position = Vector2(4995,3914)
	$Arrow.visible = false
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		talk = 1
		$Arrow.visible = true
	
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player:
		talk = 0
		$Arrow.visible = false

func _physics_process(_delta: float) -> void:
	if (talk == 1 && Input.is_action_just_pressed("Interact") && Global.able_talking == true):
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/guard.dialogue"), "start")
