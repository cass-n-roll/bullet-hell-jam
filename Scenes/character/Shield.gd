extends RigidBody2D

@export var is_picked: bool = true
@export var base_launch_force: float = 100
@export var shoot_power: float = 750
# Called when the node enters the scene tree for the first time.

var player = null

func shoot(impulse: Vector2):
	if not is_picked:
		return
	is_picked = false
	linear_velocity = impulse * shoot_power

func _integrate_forces(state):
	if not is_picked:
		return
	
	state.transform.origin = player.global_position + player.shield_pos.position.rotated(player.rotation)

func _on_bullet_hit():
	pass

func get_picked_up():
	self.linear_velocity = Vector2(0,0)
	self.angular_velocity = 0
	is_picked = true
	$PickupTimer.start()

func _on_player_shield_pickup_range():
	if not is_picked and $PickupTimer.is_stopped():
		get_picked_up()

func _process(_delta):
	debug()

func dbg_vec(vec):
	return str(floorf(vec.x * 100)/100.0) + ", " + str(floorf(vec.y * 100)/100.0)

func debug():
	$Debug/HBoxContainer/ShieldPos.text = "local : " + dbg_vec(self.position) + " ; global : " + dbg_vec(self.global_position)
	$Debug/HBoxContainer2/BodyPos.text = "local : " + dbg_vec(position) + " ; global : " + dbg_vec(global_position)
	$Debug/HBoxContainer3/IsPickable.text = str(not is_picked)
	$Debug/HBoxContainer4/Timer.text = str($PickupTimer.is_stopped())
