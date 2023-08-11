extends Node2D
class_name BoardTile

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

#func getBoardPosition():
#	self.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print(cords)
	pass # Replace with function body.
