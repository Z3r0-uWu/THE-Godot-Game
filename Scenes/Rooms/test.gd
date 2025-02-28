extends Area2D

#to know when the player is in the door or not
var inoff = 0

#Var you input
@export var x_cords: float
@export var y_cords: float
@export var level_tag: String

#player in the door
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		inoff = 1
	
#player not in the door	
func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		inoff = 0
	
#constantly sees if the player is in the door or not and if they press intereact to enter the door	
func _physics_process(_delta: float) -> void:
	if inoff == 1:
		if Input.is_action_just_pressed("Interact"):	
			match level_tag:
				"room_2_tinyroom_1":
				
					#Sets global cords
					Global.xcode = x_cords
					Global.ycode = y_cords

					#self is like this in java
					self.get_tree().change_scene_to_file.call_deferred("res://Scenes/Rooms/Tiny Rooms/room_2_tinyroom_1.tscn")
					
				"room_2_tinyroom_2":
				
					#Sets global cords
					Global.xcode = x_cords
					Global.ycode = y_cords
					
					self.get_tree().change_scene_to_file.call_deferred("res://Scenes/Rooms/Tiny Rooms/room_2_tinyroom_2.tscn")
					
				"room_2_tinyroom_3":
				
					#Sets global cords
					Global.xcode = x_cords
					Global.ycode = y_cords
					
					self.get_tree().change_scene_to_file.call_deferred("res://Scenes/Rooms/Tiny Rooms/room_2_tinyroom_3.tscn")
					
				"room_2_tinyroom_4":
				
					#Sets global cords
					Global.xcode = x_cords
					Global.ycode = y_cords
					
					self.get_tree().change_scene_to_file.call_deferred("res://Scenes/Rooms/Tiny Rooms/room_2_tinyroom_4.tscn")
					
				"room_2_tinyroom_5":
				
					#Sets global cords
					Global.xcode = x_cords
					Global.ycode = y_cords
					
					self.get_tree().change_scene_to_file.call_deferred("res://Scenes/Rooms/Tiny Rooms/room_2_tinyroom_5.tscn")
					
				"to_tavern":
					
					#Sets global cords
					Global.xcode = x_cords
					Global.ycode = y_cords
					
					self.get_tree().change_scene_to_file.call_deferred("res://Scenes/Rooms/tavern.tscn")
