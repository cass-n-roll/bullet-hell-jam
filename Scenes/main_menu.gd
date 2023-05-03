extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Music.play(Music.menu)
	$Control/Main/VBoxContainer/Button.button_down.connect(button_1)
	$Control/Main/VBoxContainer/Button2.button_down.connect(button_2)
	$Control/Main/VBoxContainer/Exit.button_down.connect(exit)

func _on_character_end_game():
	print("coucou")
	get_tree().quit()

func button_1():
	get_tree().change_scene_to_file("res://Scenes/level.tscn")

func button_2():
	print("Button 2 :'(")
	
func exit():
	get_tree().quit()

func _on_player_end_game():
	exit()
