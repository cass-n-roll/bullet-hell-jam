extends Node2D

signal end_game

func trigger_shoot():
	var dir_node = $Player/CharacterBody2D/ShootDirection
	var dir = to_global(dir_node.target_position) - dir_node.global_position
	$Shield.shoot(dir.normalized() * $Player.shoot_power)

func _ready():
	$Shield/CharacterBody2D.global_position = $Player/CharacterBody2D/ShieldPosition.global_position

func _physics_process(_delta):
	if $Shield.is_picked:
		$Shield/CharacterBody2D.global_position = $Player/CharacterBody2D/ShieldPosition.global_position


func _input(event):
	if event.is_action_pressed("shoot"):
		trigger_shoot()

func _on_player_end_game():
	emit_signal("end_game")
