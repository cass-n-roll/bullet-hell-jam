extends Node2D

signal end_game


func _ready():
	$Shield.player = $Player

func trigger_shoot():
	$Shield.shoot($Player/ShootDirection.target_position.normalized().rotated($Player.rotation))


func _input(event):
	if event.is_action_pressed("shoot"):
		trigger_shoot()

func _on_player_end_game():
	emit_signal("end_game")
