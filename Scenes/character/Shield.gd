extends Node2D

@export var is_picked: bool = true
@export var base_launch_force: float = 100
# Called when the node enters the scene tree for the first time.

func shoot(impulse: Vector2):
	if not is_picked:
		return
	is_picked = false
	$CharacterBody2D.apply_central_impulse(impulse)	

func _on_bullet_hit():
	pass

func get_picked_up():
	is_picked = true
	$PickupTimer.start()

func _on_player_shield_pickup_range():
	if not is_picked and $PickupTimer.is_stopped():
		get_picked_up()
