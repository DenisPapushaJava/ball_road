extends RigidBody2D

@export var bounce: float = 0.5
@export var friction: float = 0.2
@export var massa: float = 1.0
@onready var base_ball: RigidBody2D = $"."
signal set_freeze(is_freeze)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	physics_material_override = PhysicsMaterial.new()
	physics_material_override.bounce = bounce
	physics_material_override.friction = friction
	mass = massa
	set_freeze.connect(_on_set_freeze)
	
func  _on_set_freeze(is_freeze: bool) -> void:
	freeze = is_freeze
func set_ball_freeze(is_freeze: bool) -> void:
	set_freeze.emit(is_freeze)
