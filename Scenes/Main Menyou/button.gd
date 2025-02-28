extends Button

#When click button, game starts! :0
func _on_pressed() -> void:
	self.get_tree().change_scene_to_file.call_deferred("res://Scenes/Rooms/entrance_to_game.tscn")
