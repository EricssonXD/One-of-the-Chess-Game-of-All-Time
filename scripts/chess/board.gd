extends Node2D
class_name ChessBoard

var board = []

# Called when the node enters the scene tree for the first time.
func _ready():
	initTiles()
	var debugPiece = load("res://prefab/chess/piece.tscn").instantiate().init(board[0][0])
	debugPiece.set_name(str("DebugPiece"))
	add_child(debugPiece)
	var debugPiece2 = load("res://prefab/chess/piece.tscn").instantiate().init(board[0][1]) 
	debugPiece2.set_name(str("DebugPiece2"))
	add_child(debugPiece2)

func initTiles() -> void:
	for y in range(CONSTANTS.BOARD_DIMENSIONS.y):
		board.append([])
		for x in range(CONSTANTS.BOARD_DIMENSIONS.x):
			var new_tile = load("res://prefab/chess/board_tile.tscn").instantiate() 
			new_tile.set_name(str("Tile ",x,"_",y))
			new_tile.init(Vector2(x,y))
			add_child(new_tile)
			new_tile.global_position = Vector2(x, -y) * CONSTANTS.TILE_SIZE + CONSTANTS.BOARD_OFFSET + Vector2(0, CONSTANTS.BOARD_DIMENSIONS.y - 1) * CONSTANTS.TILE_SIZE
			board[y].append(new_tile)
			
func snappedPosition(snapPos:Vector2)-> Vector2:
	if (snapPos.x<=CONSTANTS.BOARD_OFFSET.x):
		snapPos.x = CONSTANTS.BOARD_OFFSET.x + position.x
	else: 
		snapPos.x = minf(snapPos.x, position.x + CONSTANTS.TILE_SIZE.x * CONSTANTS.BOARD_DIMENSIONS.x + CONSTANTS.BOARD_OFFSET.x - 1)
		
	if (snapPos.y<= CONSTANTS.BOARD_OFFSET.y):
		snapPos.y = CONSTANTS.BOARD_OFFSET.y + position.y
	else: 
		snapPos.y = minf(snapPos.y, position.y + CONSTANTS.TILE_SIZE.y * CONSTANTS.BOARD_DIMENSIONS.y + CONSTANTS.BOARD_OFFSET.y - 1)
		
	return snapped(snapPos + CONSTANTS.BOARD_OFFSET, CONSTANTS.TILE_SIZE) - CONSTANTS.TILE_SIZE + CONSTANTS.BOARD_OFFSET + position

func _process(delta):
	pass
