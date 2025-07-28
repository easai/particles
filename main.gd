extends Node2D

class_name Main

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
	add_child(new_molecule)
