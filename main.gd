extends Node2D

class_name Main

const MARGIN: float = 10.0
const MOLECULE = preload("res://molecule.tscn")

static var _vp_r: Rect2


static func get_vpr():
	return _vp_r


func update_vp() -> void:
	_vp_r = get_viewport_rect()


func _ready() -> void:
	update_vp()
	get_viewport().size_changed.connect(update_vp)
	for i in range(10):
		spawn_molecule()


func spawn_molecule() -> void:
	var new_molecule: Molecule = MOLECULE.instantiate()
	var x_pos: float = randf_range(_vp_r.position.x + MARGIN, _vp_r.end.x - MARGIN)
	var y_pos: float = randf_range(_vp_r.position.y + MARGIN, _vp_r.end.y - MARGIN)
	var angle: float = randf_range(0, 360)
	new_molecule.position = Vector2(x_pos, y_pos)
	new_molecule.rotation_degrees=angle
	add_child(new_molecule)
