extends Control
class_name ChessTile

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

signal remove_piece

signal add_piece

var cords

var piece = {
	"exists": false,
	"piece": null,
}

func init(pos: Vector2):
	cords = pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _can_drop_data(at_position, data):
	return true
	
func _drop_data(at_position, data):
	var piece:ChessPiece = data["origin_node"]
	piece.position = getSnappedPosition()
	piece.onTile = self

func _on_debug_tile_gui_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print(cords)
	pass

func getSnappedPosition() -> Vector2:
	return get_parent().snappedPosition(position)


