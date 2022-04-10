extends TextureButton

export(String) var text = "Text Button"


# Called when the node enters the scene tree for the first time.
func _ready():
	setup_text()

func setup_text():
	$HBoxContainer/TitleButton.text = text

func set_button_selected():
	$HBoxContainer/SelectedText.text = ">"
	
func set_button_unselected():
	$HBoxContainer/SelectedText.text = ""

func _on_TextureButton_focus_entered():
	set_button_selected()

func _on_TextureButton_focus_exited():
	set_button_unselected()

func _on_TextureButton_mouse_entered():
	set_button_selected()

func _on_TextureButton_mouse_exited():
	set_button_unselected()
