extends Node2D
class_name Board

const BOARD_DIMENSIONS = Vector2(8,8)
const BOARD_OFFSET = Vector2(4,4)
const TILE_SIZE = Vector2(15, 15)
# Called when the node enters the scene tree for the first time.
func _ready():
	initTiles()

func initTiles() -> void:
	for x in range(BOARD_DIMENSIONS.x):
		for y in range(BOARD_DIMENSIONS.y):
			var new_tile = load("res://prefab/board_tile.tscn").instantiate()
			add_child(new_tile)
			new_tile.global_position = Vector2(x, y) * TILE_SIZE + BOARD_OFFSET

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
