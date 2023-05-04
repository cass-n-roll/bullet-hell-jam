extends Node2D

enum HitGroup {BULLET, PLAYER, SHIELD, OTHER = -1}
signal bullet_hit
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func apply_central_impulse(impulse):
	$RigidBody2D.apply_central_impulse(impulse)

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

func _physics_process(_delta):
	var bodies : Array = $RigidBody2D.get_colliding_bodies()
	if bodies.size() > 1:
		print("More than one collision for a bullet")
		
	var hitted_body = null
	var hitgroup : HitGroup = HitGroup.OTHER
	for body in bodies:
		hitgroup = check_hit_group(body)
		print(self, " hit ", body, " of group ", HitGroup.keys()[hitgroup])
		if hitgroup != HitGroup.OTHER:
			hitted_body = body
			break

	if hitgroup == HitGroup.PLAYER:
		get_tree().call_group("Player", "_on_bullet_hit")
	if hitgroup == HitGroup.SHIELD:
		get_tree().call_group("Shield", "_on_bullet_hit")

	# Kill itself
	match hitgroup:
		HitGroup.PLAYER, HitGroup.SHIELD:
			hide()
			queue_free()
		
