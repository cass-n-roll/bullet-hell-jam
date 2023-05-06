extends Node2D

signal end_game

func trigger_shoot():
	var dir_node = $Player/ShootDirection
	var dir = to_global(dir_node.target_position) - dir_node.global_position
	$Shield.shoot(dir.normalized() * $Player.shoot_power)

func _ready():
	$Shield.global_position = $Player/ShieldPosition.global_position

func _physics_process(_delta):
	if $Shield.is_picked:
		$Shield.global_position = $Player/ShieldPosition.global_position


func _input(event):
	if event.is_action_pressed("shoot"):
		trigger_shoot()

func _on_player_end_game():
	emit_signal("end_game")
