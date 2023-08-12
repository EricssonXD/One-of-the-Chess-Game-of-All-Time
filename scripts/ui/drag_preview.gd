extends TextureRect

func _process(delta):
	global_position = get_global_mouse_position() - CONSTANTS.TILE_SIZE/2
	if Input.is_action_just_released("left_mouse_button"):
		ChessGlobal.dragging = false
		queue_free()
