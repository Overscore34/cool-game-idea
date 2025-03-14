extends RigidBody2D

var canBeGrabbed = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pickup_body_entered(body):
	if body.name == "player" && canBeGrabbed == true:
		canBeGrabbed = false
		print("grabbed")
		reparent($"../player")
		rotation_degrees = 0
		position = Vector2(0, 0)
