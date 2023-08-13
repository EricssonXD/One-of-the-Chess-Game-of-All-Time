extends Control
class_name ChessPiece

var onTile:ChessTile
var validTiles:Dictionary = {}
var isDragging:bool = false

func init(tile):
	setOnTile(tile)
	position = onTile.getSnappedPosition()
	return self
	
func setPiece(pieceScript:Script):
	var _onTile = onTile
	self.set_script(pieceScript)
	self.onTile = _onTile
	setTexture()
#	validTiles = _validTiles
	update_valid_tiles()
	
func _process(delta):
	if Input.is_action_just_released("left_mouse_button"):
		if isDragging:
			hide_valid_indicators()
			isDragging = false
		
func _ready():
	print("Added Box")
	custom_minimum_size = CONSTANTS.TILE_SIZE
	$pieceSprite.custom_minimum_size = custom_minimum_size
#	update_minimum_size()
	set_process_input(true)

func _get_drag_data(at_position):
	isDragging = true
	update_valid_tiles()
	show_valid_indicators()
	# Add Drag Preview
	var dragPreview = ChessGlobal.res_dragPreview.instantiate()
	dragPreview.texture = $pieceSprite.texture
	dragPreview.custom_minimum_size = CONSTANTS.TILE_SIZE
	add_child(dragPreview)
	# Data
	var data = {}
	data["origin_node"] = self
	return data

# Pass through data to tile
func _can_drop_data(at_position, data):
	if (data["origin_node"] == self):
		return false 
	return onTile._can_drop_data(at_position, data)
	
# Pass through data to tile
func _drop_data(at_position, data):
	onTile._drop_data(at_position, data)
	queue_free()
	pass

func update_valid_tiles():
	validTiles.clear()
	get_valid_tiles()
	
func get_valid_tiles():
	for i in ChessGlobal.board.values():
		setTileValid(i)

func setTileValid(tile:ChessTile):
	validTiles[tile.cords] = tile

func show_valid_indicators():
	for i in validTiles.values():
		i.showIndicator()

func hide_valid_indicators():
	for i in validTiles.values():
		i.hideIndicator()
	
func setOnTile(tile:ChessTile):
	if onTile != null:
		onTile.piece = null
	onTile = tile
	tile.piece = self

func setTexture():
	pass
