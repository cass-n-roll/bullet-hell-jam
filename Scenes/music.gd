extends Node

const TWEEN_OUT = 2.0
const TWEEN_IN = 1.0
const MIN_VOLUME = -40
var playing_music = null
var to_stop = []

@onready var menu = $menu
@onready var level1 = $level1

func _stop():
	var music = to_stop.pop_front()
	music.playing = false

func play(node):
	if( playing_music != null ):
		var t = create_tween()
		to_stop.append(playing_music)
		t.tween_property(playing_music, "volume_db", MIN_VOLUME, TWEEN_OUT).set_ease(Tween.EASE_IN)
		t.tween_callback(_stop)
	
	var t = create_tween()
	playing_music = node
	node.playing = true
	node.volume_db = MIN_VOLUME
	t.tween_property(node, "volume_db", 0, TWEEN_IN).set_ease(Tween.EASE_IN_OUT)
	t.play()

