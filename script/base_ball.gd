extends RigidBody2D

@export var bounce: float = 0.5
@export var friction: float = 0.2
@export var massa: float = 1.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	physics_material_override = PhysicsMaterial.new()
	physics_material_override.bounce = bounce
	physics_material_override.friction = friction
	mass = massa
