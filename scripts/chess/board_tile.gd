extends Container
class_name ChessTile

var cords: Vector2
var neighbouringTiles: Dictionary = {}
var attackedBy: Dictionary = {}
var piece: ChessPiece
var promotion: PackedInt32Array = []


# Called when the node enters the scene tree for the first time.
func _ready():
	custom_minimum_size = CONSTANTS.TILE_SIZE
	$Tile.custom_minimum_size = custom_minimum_size
	$ValidIndicator.custom_minimum_size = custom_minimum_size
	$DebugTile.custom_minimum_size = custom_minimum_size
	update_minimum_size()
	
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
func _process(_delta):
	pass
	
func _can_drop_data(_at_position, data):
	var cp:ChessPiece = data["origin_node"]
	if self in cp.validTiles.values():
		return true
	return false
	
func _drop_data(_at_position, data):
	var cp:ChessPiece = data["origin_node"]
	cp.hide_valid_indicators()
	cp.position = getSnappedPosition()
	cp.setOnTile(self)

func _on_debug_tile_gui_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print(cords)
		for i in attackedBy.values():
			for j in i:
				print(j.type)
	pass

func getSnappedPosition() -> Vector2:
	return get_parent().snappedPosition(position)

func showIndicator():
	$ValidIndicator.visible = true
	
func hideIndicator():
	$ValidIndicator.visible = false
