extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Control/HBoxContainer/VBoxContainer/Button.button_down.connect(button_1)
	$Control/HBoxContainer/VBoxContainer/Button2.button_down.connect(button_2)
	$Control/HBoxContainer/VBoxContainer/Exit.button_down.connect(exit)

func button_1():
	print("Button 1 :D")

func button_2():
	print("Button 2 :'(")


func exit():
	get_tree().quit()
