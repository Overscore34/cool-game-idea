extends CharacterBody2D

var SPEED = 300.0
var JUMP_VELOCITY = -400.0

func _ready():
	print(get_child(-1).name)

func _physics_process(delta):
	print(get_child(-1).name)
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func _on_area_2d_body_entered(body):
	if get_child(-1).name == "fireHero":
		if $fireHero.get_parent() == body:
			$fireHero.apply_impulse(Vector2(randf_range(-300, 600), randf_range(-500, -700)), Vector2(0, 0))
			$fireHero.reparent($"../")
			$basic.visible = true

func _on_pickup_body_entered(body):
	if body.name == name:
		$basic.visible = false
