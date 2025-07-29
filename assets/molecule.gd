extends RigidBody2D

class_name Molecule

const MARGIN: int = 1
var velocity = Vector2(randf_range(300.0, 400.0), 0.0)


func born() -> void:
	var _vp_r = Main.get_vpr()
	var x_pos: float = randf_range(_vp_r.position.x + MARGIN, _vp_r.end.x - MARGIN)
	var y_pos: float = randf_range(_vp_r.position.y + MARGIN, _vp_r.end.y - MARGIN)
	var angle: float = randf_range(0, 360)
	position = Vector2(x_pos, y_pos)
	rotation_degrees = angle


func _ready() -> void:
	born()


func _physics_process(delta: float) -> void:
	#position += velocity.rotated(rotation - PI / 2) * delta

	var collision = move_and_collide(velocity * delta)
	if collision:
		var bounced = velocity.bounce(collision.get_normal())
		var angle_variation = randf_range(-0.2, 0.2)  # radians
		velocity = bounced.rotated(angle_variation) * randf_range(0.9, 1.1)


func reborn() -> void:
	born()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	born()
