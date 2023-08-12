extends Control
class_name ChessPiece

var onTile:ChessTile

func init(tile):
	onTile = tile
	position = onTile.getSnappedPosition()
	return self
	
func _ready():
	custom_minimum_size = CONSTANTS.TILE_SIZE
	$pieceSprite.custom_minimum_size = custom_minimum_size
#	update_minimum_size()
	set_process_input(true)

func _get_drag_data(at_position):
	ChessGlobal.dragging = true
	var data = {}
	var dragPreview = load("res://prefab/ui/drag_preview.tscn").instantiate()
	dragPreview.texture = $pieceSprite.texture
	dragPreview.custom_minimum_size = CONSTANTS.TILE_SIZE
	add_child(dragPreview)
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

