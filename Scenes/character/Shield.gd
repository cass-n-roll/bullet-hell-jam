extends Node2D

@export var is_picked: bool = true
@export var base_launch_force: float = 100
# Called when the node enters the scene tree for the first time.

func shoot(direction: Vector2, force: float=base_launch_force):
	is_picked = false
	$CharacterBody2D.apply_central_impulse(direction.normalized() * base_launch_force)

func _on_bullet_hit():
	pass
