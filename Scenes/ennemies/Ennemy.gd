extends "res://Scenes/ennemies/Ennemy.gd"

@export var shoot_interval : float 
@export var shoot_force: float

@export 

var bullet_scene = preload("res://Scenes/bullets/BasicBullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$ShootTimer.wait_time = shoot_interval
	$ShootTimer.timeout.connect(_on_timer_timeout)

func shoot():
	var bullet = bullet_scene.instantiate()
	
	bullet.position = $BulletSpawnPosition.position
	var impulse = to_global($RayCast2D.target_position).normalized() * shoot_force
	bullet.apply_central_impulse(impulse)
	print(impulse)
	add_child(bullet)
	

func _on_timer_timeout():
	shoot()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
