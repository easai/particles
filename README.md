# particles

This Godot app visualizes water (H₂O), oxygen (O₂), and carbon dioxide (CO₂) molecules moving and interacting in a fluid environment. It’s a stylized educational simulation, ideal for teaching molecular behavior or creating ambient visual effects.

### Core Features
Molecule Types:
- Water: Bent shape with two hydrogen atoms and one oxygen.
- Oxygen: Diatomic linear molecule.
- Carbon Dioxide: Linear molecule with one carbon and two oxygen atoms.

### Movement Simulation:

* Molecules move using randomized velocity vectors.
* Bounce off screen edges using VisibleOnScreenNotifier2D or manual boundary checks.
* Optional Brownian motion effect via noise-based velocity perturbation.

### Scattering Logic:

Molecules are instantiated randomly across the viewport.
Use Area2D nodes with custom velocity logic:

```gdscript
var velocity := Vector2(randf_range(-100, 100), randf_range(-100, 100))

func _process(delta):
    position += velocity * delta
```

### Visual Representation:

Each molecule is a Node2D with child Sprite2D nodes for atoms.
Use color coding: red for oxygen, white for hydrogen, black for carbon.
Optional animated jitter or rotation for realism.

### Scene Setup
```gdscript
# MoleculeSpawner.gd
extends Node2D

@export var molecule_scene: PackedScene
@export var count := 50

func _ready():
    for i in count:
        var mol = molecule_scene.instantiate()
        mol.position = Vector2(randf_range(0, 1024), randf_range(0, 768))
        add_child(mol)
```
Each molecule scene (WaterMolecule.tscn, OxygenMolecule.tscn, etc.) contains:

- Area2D root
- Sprite2D children for atoms
- Movement script with randomized velocity

  
