extends ChessPiece

func  _init():
	super._init()
	self.type = CONSTANTS.TYPE.Rook

func get_valid_tiles():
	possiblePin = null
	recur(onTile, Vector2(1,0))
	recur(onTile, Vector2(-1,0))
	recur(onTile, Vector2(0,1))
	recur(onTile, Vector2(0,-1))

var possiblePin:ChessPiece
func recur(tile: ChessTile, direction: Vector2, blocked:bool = false, maybePin:bool = false):
	if tile == null:
		return -1
	if !blocked:
		setTileValid(tile)
	var blockCheck:int = -1
	if tile.piece != null and tile.piece != self:
		# If is my own piece
		if tile.piece.playerID == playerID:
			return -1
		# If it is enemy king
		if tile.piece.type == CONSTANTS.TYPE.King and tile.piece.playerID != playerID:
			blockCheck = tile.piece.playerID
			if maybePin:
				print("PINNNENENEDN")
				possiblePin.pinned = true
		else:
			# if its enemy other pieces
			blocked = true
			if !maybePin:
				print("Maybe???")
				maybePin = true
				possiblePin = tile.piece
			elif tile.piece.playerID != playerID:
				print("Welp no")
				possiblePin = null
				
			
	blockCheck = max(recur(tile.neighbouringTiles[direction], direction, blocked),blockCheck)
	if blockCheck != -1:
		ChessGlobal.players[blockCheck].blockCheck.append(tile)
	return blockCheck


func setTexture():
	$pieceSprite.texture = Assets.Textures.Rook[playerID]

	
