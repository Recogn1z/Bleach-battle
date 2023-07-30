extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Called when the button is pressed.



func _on_pressed():
	get_tree().change_scene_to_file("res://scene/control.tscn")
