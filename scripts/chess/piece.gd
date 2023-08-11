extends Control
class_name ChessPiece

var onTile:ChessTile

func init(tile):
	onTile = tile
	position = onTile.getSnappedPosition()
	return self
	
func _ready():
	set_process_input(true)

func _get_drag_data(at_position):
	print(onTile.name)
	var data = {}
	var dragPreview = load("res://prefab/ui/drag_preview.tscn").instantiate()
	dragPreview.texture = $TextureRect.texture
	add_child(dragPreview)
	data["origin_node"] = self
	return data

func _can_drop_data(at_position, data):
	
	return true

func _drop_data(at_position, data):
	queue_free()
	pass

