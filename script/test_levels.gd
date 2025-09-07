extends Node2D

@onready var goal: Area2D = $BaseGoal
@onready var ball: RigidBody2D = $BaseBall
@onready var next: Button = $HBoxContainerButton/Next

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	goal.goal_reached.connect(on_goal_reached)


func  on_goal_reached(ball_ref):
	next.visible = true
	print("FINISH")


func _on_button_pressed() -> void:
	ball.set_ball_freeze(false)


func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()


func _on_next_pressed() -> void:
	GameState.load_next_level()
