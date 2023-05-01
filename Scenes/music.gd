extends Node

const TWEEN_OUT = 2.0
const TWEEN_IN = 1.0
const MIN_VOLUME = -40
var playing_music = null
var to_stop = []

@onready var menu = $menu
@onready var level1 = $level1

func _pop():
	var music = to_stop.pop_front()
	music.playing = false

func stop():
	if( playing_music != null ):
		var t = create_tween()
		to_stop.append(playing_music)
		t.tween_property(playing_music, "volume_db", MIN_VOLUME, TWEEN_OUT).set_ease(Tween.EASE_IN)
		t.tween_callback(_pop)

func play(node):
	stop()
	
	var t = create_tween()
	node.play()
	node.volume_db = MIN_VOLUME
	playing_music = node
	t.tween_property(node, "volume_db", 0, TWEEN_IN).set_ease(Tween.EASE_IN_OUT)
	t.play()

#syncs the music to the pos of the last music
func play_sync(node): ##only use with files of the same length, or it might be weird
	var pos = 0.0
	if( playing_music != null ):
		pos = playing_music.get_playback_position()
	
	stop()
	
	var t = create_tween()
	node.play(pos)
	node.volume_db = MIN_VOLUME
	playing_music = node
	t.tween_property(node, "volume_db", 0, TWEEN_IN).set_ease(Tween.EASE_IN_OUT)
	t.play()
