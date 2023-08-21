extends ChessPiece

func  _init():
	super._init()
	self.type = CONSTANTS.TYPE.Queen

func get_valid_tiles():
	for x in [-1,0,1]:
		for y in [-1,0,1]:
			if x == 0 and y == 0:
				continue
			recur(onTile, Vector2(x,y))

	
func recur(tile: ChessTile, direction: Vector2, blocked:bool = false):
	if tile == null:
		return -1
	if !blocked:
		setTileValid(tile)
	var blockCheck:int = -1
	if tile.piece != null and tile.piece != self:
		if tile.piece.type == CONSTANTS.TYPE.King and tile.piece.playerID != playerID:
			blockCheck = tile.piece.playerID
		else:
			blocked = true
			
	blockCheck = max(recur(tile.neighbouringTiles[direction], direction, blocked),blockCheck)
	if blockCheck != -1:
		ChessGlobal.players[blockCheck].blockCheck.append(tile)
	return blockCheck
	


func setTexture():
	$pieceSprite.texture = Assets.Textures.Queen[playerID]
	
