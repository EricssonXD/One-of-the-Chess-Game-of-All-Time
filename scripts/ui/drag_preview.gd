extends TextureRect

func _process(_delta):
	global_position = get_global_mouse_position() - CONSTANTS.TILE_SIZE/2
	if Input.is_action_just_released("left_mouse_button"):
		queue_free()
