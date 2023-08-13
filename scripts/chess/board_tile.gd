extends Container
class_name ChessTile

var cords
var neighbouringTiles: Dictionary = {}
var attackedBy: Dictionary = {}
var piece


# Called when the node enters the scene tree for the first time.
func _ready():
	custom_minimum_size = CONSTANTS.TILE_SIZE
	$Tile.custom_minimum_size = custom_minimum_size
	$ValidIndicator.custom_minimum_size = custom_minimum_size
	$DebugTile.custom_minimum_size = custom_minimum_size
	update_minimum_size()
	pass # Replace with function body.
	
func set_neighbouringTiles():
	for x in [-1,0,1]:
		for y in [-1,0,1]:
			# Neighbour Cords
			var nc: Vector2 = Vector2(x,y) + cords
			if nc.x < 0 or nc.y < 0 or nc.x >= CONSTANTS.BOARD_DIMENSIONS.x or nc.y >= CONSTANTS.BOARD_DIMENSIONS.y:
				neighbouringTiles[Vector2(x,y)] = null
			else:
				neighbouringTiles[Vector2(x,y)] = ChessGlobal.board[nc]
	pass

func init(pos: Vector2):
	cords = pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _can_drop_data(at_position, data):
	var piece:ChessPiece = data["origin_node"]
	if self in piece.validTiles.values():
		return true
	return false
	
func _drop_data(at_position, data):
	var piece:ChessPiece = data["origin_node"]
	piece.hide_valid_indicators()
	piece.position = getSnappedPosition()
	piece.setOnTile(self)

func _on_debug_tile_gui_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print(cords)
	pass

func getSnappedPosition() -> Vector2:
	return get_parent().snappedPosition(position)

func showIndicator():
	$ValidIndicator.visible = true
	
func hideIndicator():
	$ValidIndicator.visible = false
