extends Node2D

signal end_game

func _ready():
	$Shield/CharacterBody2D.global_position = $Player/CharacterBody2D/ShieldPosition.global_position

func _physics_process(delta):
	if $Shield.is_picked:
		$Shield/CharacterBody2D.global_position = $Player/CharacterBody2D/ShieldPosition.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
