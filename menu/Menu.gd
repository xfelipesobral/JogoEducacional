extends Control

func _ready():
	$VBoxContainer/StartButton.grab_focus()

func _on_StartButton_pressed():
	get_tree().change_scene("res://mapas/Rua.tscn")


func _on_ExitButton_pressed():
	get_tree().quit()
