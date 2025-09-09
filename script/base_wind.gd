extends Area2D
@export var wind_force: float = 500
@export var wind_direction: Vector2 = Vector2.LEFT
@onready var wind_particle: GPUParticles2D = $WindParticle
@export var is_active: bool = true

var _bodies_in_area: Array[RigidBody2D] = []

signal wind_toggled(active:bool)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	wind_direction = wind_direction.normalized()
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	_update_state()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if !is_active:
		return
	for body in _bodies_in_area:
		if body is RigidBody2D:
			body.apply_central_force(wind_direction * wind_force * delta)
			
func _on_body_entered(body: Node) -> void:
	if body is RigidBody2D:
		if is_active:
			body.apply_central_impulse(wind_direction * wind_force *0.1)
		else :
			if body not  in _bodies_in_area:
				_bodies_in_area.append(body)
func _on_body_exited(body: Node) -> void:
	if body is RigidBody2D && body in _bodies_in_area:
		_bodies_in_area.erase(body)

func set_active(active: bool) -> void:
	if is_active == active:
		return
	is_active = active
	_update_state()
	emit_signal("wind_toggled", is_active)
func _update_state() -> void:
	wind_particle.emitting = is_active
	
	
