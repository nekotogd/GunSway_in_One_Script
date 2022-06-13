extends Spatial

export(Vector3) var LIMITS := Vector3(1.0, 1.0, 1.0)
export(float, 0.0, 1.0) var return_speed : float = 0.1
export(float) var sway_speed : float = 1.0
export(float) var mouse_sensitivity : float = 0.125

var mov : Vector2
var input_direction : Vector2

# Controls the steepness of the graph, don't bother changing
# because its effect gets exponentially smaller as you increase it
# Check https://www.desmos.com/calculator/yqgdwztfru
var diminish_rate : float = 26.0

func diminish(x : float) -> float:
	return min(1.0 / max(diminish_rate * x * x, 1.0), 1.0)

func _input(event):
	if event is InputEventMouseMotion:
		mov = event.relative * (mouse_sensitivity / 100.0)
		
		var d = diminish(rotation.y / LIMITS.x)
		rotate_y(mov.x * d * sway_speed)
		
		var fwd : Vector3 = transform.xform(Vector3.FORWARD)
		var axis : Vector3 = Vector3.FORWARD.rotated(Vector3.UP, rotation.y)
		var angle : float = fwd.angle_to(axis)
		d = diminish(angle / LIMITS.y)
		
		var tx := Transform()
		tx = tx.rotated(Vector3.RIGHT, mov.y * d * sway_speed)
		transform = tx * transform

func _process(_delta):
	var roll : float = sign(input_direction.x) * LIMITS.z
	roll = deg2rad(roll)
	var tz := Transform()
	tz = tz.rotated(Vector3.FORWARD, roll)
	transform = tz * transform
	
	transform = transform.interpolate_with(Transform(), return_speed)
