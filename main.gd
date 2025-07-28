extends Node2D

class_name Main

const MOLECULE = preload("res://molecule.tscn")
const OXYGEN = preload("res://oxygen.tscn")
const CARBON_DIOXIDE = preload("res://carbon_dioxide.tscn")

static var _vp_r: Rect2

static func get_vpr():
	return _vp_r


func update_vp() -> void:
	_vp_r = get_viewport_rect()


func _ready() -> void:
	update_vp()
	get_viewport().size_changed.connect(update_vp)
	spawn_molecule()


func spawn_molecule() -> void:
	for i in range(7):
		var new_molecule: Molecule = MOLECULE.instantiate()
		add_child(new_molecule)
	for i in range(10):
		var new_oxygen: Oxygen = OXYGEN.instantiate()
		add_child(new_oxygen)	
	for i in range(5):
		var new_carbon_dioxide: CarbonDioxide = CARBON_DIOXIDE.instantiate()
		add_child(new_carbon_dioxide)
