extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print(Music.menu)
	Music.play(Music.menu)
	$Control/Main/VBoxContainer/Button.button_down.connect(button_1)
	$Control/Main/VBoxContainer/Button2.button_down.connect(button_2)
	$Control/Main/VBoxContainer/Exit.button_down.connect(exit)

func button_1():
	get_tree().change_scene_to_file("res://Scenes/level.tscn")

func button_2():
	print("Button 2 :'(")


func exit():
	get_tree().quit()
