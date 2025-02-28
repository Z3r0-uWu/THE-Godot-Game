#Global Script

extends Area2D

#Inputs you put in to know what room player is going to and where it wants to spawn them
@export var x_cords: float
@export var y_cords: float
@export var level_tag: String

#changing scenes/rooms
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		
		match level_tag:
			"room_1":
				
				#Sets global cords
				Global.xcode = x_cords
				Global.ycode = y_cords

				#self is like this in java
				self.get_tree().change_scene_to_file.call_deferred("res://Scenes/Rooms/room_1.tscn")
			"entrance_to_game":
				
				#Sets global cords
				Global.xcode = x_cords
				Global.ycode = y_cords
				self.get_tree().change_scene_to_file.call_deferred("res://Scenes/Rooms/entrance_to_game.tscn")
			"room_2":
				
				#Sets global cords
				Global.xcode = x_cords
				Global.ycode = y_cords
				self.get_tree().change_scene_to_file.call_deferred("res://Scenes/Rooms/room_2.tscn")
				
			"the_town":
			
				#Sets global cords
				Global.xcode = x_cords
				Global.ycode = y_cords
				self.get_tree().change_scene_to_file.call_deferred("res://Scenes/Rooms/the_town.tscn")
