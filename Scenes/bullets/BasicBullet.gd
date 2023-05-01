extends Node2D

enum HitGroup {BULLET, PLAYER, SHIELD, OTHER = -1}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func check_hit_group(body: Node2D) -> HitGroup:
	var hitgroup : HitGroup = HitGroup.OTHER
	for group in body.get_groups():
		print(group)
		match group:
			"Player":
				hitgroup = HitGroup.PLAYER
				break
			"Bullets":
				hitgroup = HitGroup.BULLET
				break
			"Shield":
				hitgroup = HitGroup.SHIELD
				break
	return hitgroup

func _physics_process(delta):
	var bodies : Array = $RigidBody2D.get_colliding_bodies()
	if bodies.size() > 1:
		print("More than one collision for a bullet")
	elif bodies.size() == 1:
		print("found one")

	var hitted_body = null
	var hitgroup : HitGroup = HitGroup.OTHER
	for body in bodies:
		print(body)
		hitgroup = check_hit_group(body)
		if hitgroup != HitGroup.OTHER:
			hitted_body = body
			break
	
	if hitted_body != null and hitgroup != HitGroup.OTHER:
		emit_signal("bullet_hit")
	
	# Kill itself
	match hitgroup:
		HitGroup.PLAYER, HitGroup.SHIELD:
			hide()
			queue_free()
		
