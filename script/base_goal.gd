extends Area2D

@onready var confetti: GPUParticles2D = $Confetti
signal goal_reached(ball)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("balls"):
		emit_signal("goal_reached", body)
		_show_confetti()
func _show_confetti():
	confetti.restart()
	confetti.emitting = true
