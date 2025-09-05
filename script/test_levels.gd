extends Node2D

@onready var goal: Area2D = $BaseGoal
@onready var ball: RigidBody2D = $BaseBall

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	goal.goal_reached.connect(on_goal_reached)


func  on_goal_reached(ball_ref):
	print("FINISH")
