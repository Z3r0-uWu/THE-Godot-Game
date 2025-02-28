extends CanvasLayer

func _physics_process(_delta: float) -> void:
	
	#When the player gets hurts, skulls dissapear
	if Global.health_player == 4:
		get_node("Health/HBoxContainer/Hearts5").hide()
	if Global.health_player == 3:
		get_node("Health/HBoxContainer/Hearts4").hide()
	if Global.health_player == 2:
		get_node("Health/HBoxContainer/Hearts3").hide()
	if Global.health_player == 1:
		get_node("Health/HBoxContainer/Hearts2").hide()
	if Global.health_player == 0:
		get_node("Health/HBoxContainer/Hearts").hide()
	
	#player_get_hurts.emit()
		if Global.health_player == 0:
			
			#This removes removes CollisionObject shit... sigh...
			#Global.xcode = 50
			#Global.ycode = 500
			#self.get_tree().change_scene_to_file.call_deferred("res://Scenes/Rooms/room_1.tscn")
			Global.health_player = 5
