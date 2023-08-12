extends BoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	custom_minimum_size = CONSTANTS.TILE_SIZE * CONSTANTS.BOARD_DIMENSIONS + CONSTANTS.BOARD_OFFSET*2
	update_minimum_size()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
