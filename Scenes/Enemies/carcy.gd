extends CharacterBody2D

#Might run into issues with this
#Class_name!
class_name Enemy

#to imput where you want to put Carcy
@export var starting_x: float
@export var starting_y: float

var SPEED = 1

var health = Global.carcy_health

#Sets where they spawn
func _ready():
	self.global_position = Vector2(starting_x,starting_y)

#Moves Carcy back and forth
func _physics_process(_delta: float) -> void:
	position.x += SPEED
		
	if position.x >= (starting_x+100):
		transform.x.x = -1
		SPEED -= 1
	if position.x <= (starting_x-100):
		transform.x.x = 1
		SPEED += 1

#When player enters Carcy's hitbox
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		Global.health_player -= 1
		print(Global.health_player)

func _on_hit_box_area_entered(area: Area2D) -> void:
	if area is punch:
		health -= Global.punch_damage
		print(health)
		
	if health <= 0:
		queue_free()
