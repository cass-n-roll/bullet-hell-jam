extends CharacterBody2D


const SPEED = 300.0
const JOYSTICK_MOVE_THRESHOLD = 0.1
const JOYSTICK_SHOOT_THRESHOLD = 0.15
const JOYSTICK_SHOOT_MIN_LENGTH = 0.6

var move_dir : Vector2 = Vector2(0, 0)
var shoot_dir : Vector2 = Vector2(0, 0)

func dbg_vec(vec):
	return str(floorf(vec.x * 100)/100.0) + ", " + str(floorf(vec.y * 100)/100.0)

func _physics_process(delta):
	$Debug/VBoxContainer/HBoxContainer/MoveDir.text = dbg_vec(move_dir)
	$Debug/VBoxContainer/HBoxContainer2/ShootDir.text = dbg_vec(shoot_dir)
	$Debug/VBoxContainer/HBoxContainer3/Pos.text = dbg_vec(position)
	
	rotation = Vector2(-shoot_dir.y, shoot_dir.x).angle()
	velocity = move_dir * SPEED;
	
	move_and_slide()


func joy_axis_move(value):
	if abs(value) < JOYSTICK_MOVE_THRESHOLD: return 0.0
	return value

func joy_axis_shoot(value, original):
	if abs(value) < JOYSTICK_SHOOT_THRESHOLD:
		if shoot_dir.length() > JOYSTICK_SHOOT_MIN_LENGTH: return 0.0
		else: return original
	return value

func _input(event):
	if event is InputEventJoypadMotion:
		if event.axis == JOY_AXIS_LEFT_X: move_dir.x = joy_axis_move(event.axis_value)
		elif event.axis == JOY_AXIS_LEFT_Y: move_dir.y = joy_axis_move(event.axis_value)
		elif event.axis == JOY_AXIS_RIGHT_X: shoot_dir.x = joy_axis_shoot(event.axis_value, shoot_dir.x)
		elif event.axis == JOY_AXIS_RIGHT_Y: shoot_dir.y = joy_axis_shoot(event.axis_value, shoot_dir.y)
	else:
		if event.is_action_pressed("left"): move_dir.x -= 1
		if event.is_action_released("left"): move_dir.x += 1
		if event.is_action_pressed("right"): move_dir.x += 1
		if event.is_action_released("right"): move_dir.x -= 1

		if event.is_action_pressed("up"): move_dir.y -= 1
		if event.is_action_released("up"): move_dir.y += 1
		if event.is_action_pressed("down"): move_dir.y += 1
		if event.is_action_released("down"): move_dir.y -= 1


		if event.is_action_pressed("aim_left"): shoot_dir.x -= 1
		if event.is_action_released("aim_left"): shoot_dir.x += 1
		if event.is_action_pressed("aim_right"): shoot_dir.x += 1
		if event.is_action_released("aim_right"): shoot_dir.x -= 1
		
		if event.is_action_pressed("aim_up"): shoot_dir.y -= 1
		if event.is_action_released("aim_up"): shoot_dir.y += 1
		if event.is_action_pressed("aim_down"): shoot_dir.y += 1
		if event.is_action_released("aim_down"): shoot_dir.y -= 1
	
	move_dir.x = clampf(move_dir.x, -1, 1)
	move_dir.y = clampf(move_dir.y, -1, 1)
	shoot_dir.x = clampf(shoot_dir.x, -1, 1)
	shoot_dir.y = clampf(shoot_dir.y, -1, 1)
