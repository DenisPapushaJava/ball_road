extends Control
enum MenuType {MAIN, PAUSE}
@export var menu_type: MenuType = MenuType.MAIN
@onready var play_button: Button = $VBoxContainer/PlayButton
@onready var label_fps: Label = $LabelFPS
@onready var quit_button: Button = $VBoxContainer/QuitButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_update_menu()
func  _process(delta: float) -> void:
	label_fps.text = str(Engine.get_frames_per_second())
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _update_menu() -> void:
	match  menu_type:
		MenuType.MAIN:
			play_button.show()
			
		MenuType.PAUSE:
			play_button.hide()


func _on_play_button_pressed() -> void:
	GameState.load_level(1)

func _on_quit_button_pressed() -> void:
	get_tree().quit()
