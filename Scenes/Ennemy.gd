extends Node2D

@export var shoot_interval : float 

var bullet_scene = preload("res://Scenes/bullets/BasicBullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = shoot_interval
	self.connect("timeout", _on_timer_timeout)

func shoot():
	var bullet = bullet_scene.instantiate()
	
	bullet.position = $BulletSpawnPosition.position
#	var impulse_direction = self.
	bullet.apply_central_impulse()
	
	add_child(bullet)

func _on_timer_timeout():
	shoot()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
