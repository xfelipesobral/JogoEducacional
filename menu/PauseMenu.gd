extends Control

func _input(event):
	print(event)
	if event.is_action_pressed("ui_cancel"):
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		visible = new_pause_state
		get_node("Controls/ReturnGame").grab_focus()

func _on_ReturnGame_pressed():
	get_tree().paused = false
	visible = false

func _on_MainMenu_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://menu/Menu.tscn")
