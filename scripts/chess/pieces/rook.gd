extends ChessPiece

func  _init():
	super._init()
	self.type = CONSTANTS.TYPE.Rook

func get_valid_tiles():
	recur(onTile, Vector2(1,0))
	recur(onTile, Vector2(-1,0))
	recur(onTile, Vector2(0,1))
	recur(onTile, Vector2(0,-1))

func recur(tile: ChessTile, direction: Vector2, blocked:bool = false):
	if tile == null:
		return -1
	if !blocked:
		setTileValid(tile)
	var blockCheck:int = -1
	if tile.piece != null and tile.piece != self:
		if !(tile.piece.type == CONSTANTS.TYPE.King and tile.piece.playerID != playerID):
			blocked = true
		else:
			blockCheck = tile.piece.playerID
	blockCheck = recur(tile.neighbouringTiles[direction], direction, blocked)
	if blockCheck != -1:
		ChessGlobal.players[blockCheck].append(tile)
	return blockCheck


func setTexture():
	$pieceSprite.texture = Assets.Textures.Rook[playerID]

	
