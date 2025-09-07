extends StaticBody2D

@export var is_slippery: bool = false
@export var friction: float = 1.0
@export var bounce: float = 0.2

var dragging: bool = false
var offset: Vector2 = Vector2.ZERO

func _ready() -> void:
	if physics_material_override == null:
		physics_material_override = PhysicsMaterial.new()
	physics_material_override.friction = friction
	physics_material_override.bounce = bounce
func _process(delta: float) -> void:
	if dragging:
		global_position = get_global_mouse_position() + offset
		
func  _input_event(viewport, event, shape_idx) -> void:
	print("click")
	if event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			dragging = true
			offset = global_position - get_global_mouse_position()
		else :
			dragging = false
