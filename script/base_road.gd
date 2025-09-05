extends StaticBody2D

@export var is_slippery: bool = false
@export var friction: float = 1.0
@export var bounce: float = 0.2


func _ready() -> void:
	if physics_material_override == null:
		physics_material_override = PhysicsMaterial.new()
	physics_material_override.friction = friction
	physics_material_override.bounce = bounce
