extends Node2D
class_name Board

const BOARD_DIMENSIONS = Vector2(8,8)
const BOARD_OFFSET = Vector2(4,4)
const TILE_SIZE = Vector2(15, 15)

var board = []

# Called when the node enters the scene tree for the first time.
func _ready():
	initTiles()

func initTiles() -> void:
	for y in range(BOARD_DIMENSIONS.y):
		board.append([])
		for x in range(BOARD_DIMENSIONS.x):
			var new_tile = load("res://prefab/board_tile.tscn").instantiate() 
			new_tile.set_name(str("Tile ",x,"_",y))
			new_tile.init(Vector2(x,y))
			add_child(new_tile)
			new_tile.global_position = Vector2(x, -y) * TILE_SIZE + BOARD_OFFSET + Vector2(0, BOARD_DIMENSIONS.y - 1)*TILE_SIZE
			board[y].append(new_tile)
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
