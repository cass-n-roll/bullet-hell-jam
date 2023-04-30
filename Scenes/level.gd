extends Node2D


# Automatiser la taille du niveau avec les world boundaries
var screen_size

# Called when the node enters the scene tree for the first time.
func init_boundaries():
	# Y off set of 5 to see boundary
	$Boundaries/North.shape.a = Vector2(0, 5)
	$Boundaries/North.shape.b = Vector2(screen_size.x, 5)

	$Boundaries/South.shape.a = Vector2(0, screen_size.y)
	$Boundaries/South.shape.b = Vector2(screen_size.x, screen_size.y)
	
	$Boundaries/East.shape.a = Vector2(screen_size.x, 0)
	$Boundaries/East.shape.b = Vector2(screen_size.x, screen_size.y)

	$Boundaries/West.shape.a = Vector2(0, 0)
	$Boundaries/West.shape.b = Vector2(0, screen_size.y)

func _ready():
	screen_size = get_viewport_rect().size
	init_boundaries()
	# Update boundaries when resize
	get_tree().root.connect("size_changed", init_boundaries)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
