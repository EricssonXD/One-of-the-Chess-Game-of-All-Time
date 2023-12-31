extends Node2D
class_name ChessBoard

# Called when the node enters the scene tree for the first time.
func _ready():
	$BoxContainer.custom_minimum_size = CONSTANTS.TILE_SIZE * CONSTANTS.BOARD_DIMENSIONS + CONSTANTS.BOARD_OFFSET*2
	initTiles()
	setupBoard()
	SignalManager.whenEndTurn.connect(onEndTurn)

func initTiles() -> void:
	for y in range(CONSTANTS.BOARD_DIMENSIONS.y):
		for x in range(CONSTANTS.BOARD_DIMENSIONS.x):
			var new_tile = ChessGlobal.res_boardTile.instantiate() 
			new_tile.set_name(str("Tile ",x,"_",y))
			new_tile.init(Vector2(x,y))
			add_child(new_tile)
			new_tile.global_position = Vector2(x, -y) * CONSTANTS.TILE_SIZE + CONSTANTS.BOARD_OFFSET + Vector2(0, CONSTANTS.BOARD_DIMENSIONS.y - 1) * CONSTANTS.TILE_SIZE
#			ChessGlobal.board[y].append(new_tile)
			ChessGlobal.board[Vector2(x,y)] = new_tile
	for i in ChessGlobal.board.values():
		i.set_neighbouringTiles()
		
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


func _process(_delta):
	pass
	
func onEndTurn(playerID:int):
	if ChessGlobal.players[playerID].isChecked:
		ChessGlobal.players[playerID].isChecked = false
		ChessGlobal.players[playerID].blockCheck.clear()
	ChessGlobal.playerTurn = (ChessGlobal.playerTurn + 1) % ChessGlobal.players.size()
	updateAllValidTiles()
#	remove tiles that does not block check if the player next turn is checked
	if ChessGlobal.players[ChessGlobal.playerTurn].isChecked:
		print(ChessGlobal.playerTurn)
		for p in ChessGlobal.players[ChessGlobal.playerTurn].pieces:
			for v in p.validTiles.values():
				if !(v in ChessGlobal.players[ChessGlobal.playerTurn].blockCheck):
					p.validTiles.erase(v.cords)
	pass

func updateAllValidTiles():
#	clear attacked by
	for i in ChessGlobal.board.values():
		i.attackedBy.clear()
#	update every chess piece and at last update king
	var kings = []
	for player in ChessGlobal.players:
		for piece in player.pieces:
			(piece as ChessPiece).update_valid_tiles()
			if (piece as ChessPiece).type == CONSTANTS.TYPE.King:
				kings.append(piece)
	for k in kings:
		k.update_valid_tiles()
		
func setupBoard():
	# Add Players
	ChessGlobal.createPlayer("White")
	ChessGlobal.createPlayer("Black")
	# White Pieces
	addPiece(Vector2(0,0), 0, Assets.Piece.Rook)
	addPiece(Vector2(1,0), 0, Assets.Piece.Knight)
	addPiece(Vector2(2,0), 0, Assets.Piece.Bishop)
	addPiece(Vector2(3,0), 0, Assets.Piece.Queen)
	addPiece(Vector2(4,0), 0, Assets.Piece.King)
	addPiece(Vector2(7,1), 0, Assets.Piece.Pawn)
	# Black Pieces
	addPiece(Vector2(4,7), 1, Assets.Piece.Rook)
	addPiece(Vector2(3,7), 1, Assets.Piece.King)
	addPiece(Vector2(7,6), 1, Assets.Piece.Pawn).forward = -1
	setupPromotionTiles()
	ChessGlobal.inGame = true
	updateAllValidTiles()

func setupPromotionTiles():
	for i in ChessGlobal.board.values():
		if i.cords.y == 0:
			i.promotion.append(1)
			continue
		if i.cords.y == CONSTANTS.BOARD_DIMENSIONS.y -1:
			i.promotion.append(0)

func addPiece(cords:Vector2, playerID:int,script:Script = null) -> ChessPiece:
	var piece:ChessPiece = Assets.Piece.Base.instantiate().init(ChessGlobal.board[cords], playerID)
	if script != null:
		piece.setPiece(script)
#	piece.set_name(str("Rook"))
	add_child(piece)
	ChessGlobal.players[playerID].pieces.append(piece)
	return piece
