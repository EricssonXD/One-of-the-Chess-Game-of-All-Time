extends ChessPiece

func  _init():
	super._init()
	self.type = CONSTANTS.TYPE.Knight
	
func get_valid_tiles():
	const moves: PackedVector2Array = [
		Vector2(2, 1),
		Vector2(2, -1),
		Vector2(-2, 1),
		Vector2(-2, -1),
		Vector2(1, 2),
		Vector2(1, -2),
		Vector2(-1, 2),
		Vector2(-1, -2)
	]
	for move in moves:
		var tile = ChessGlobal.board.get(move + onTile.cords)
		if tile != null:
			setTileValid(tile)


#func lilFunction(tile: ChessTile, direction: Vector2, blocked:bool = false):
#	if tile == null:
#		return
#	tile = tile.neighbouringTiles[direction];
#	if tile == null:
#		return
#	tile = tile.neighbouringTiles[direction];
#	if tile == null:
#		return
#	direction = Vector2(direction.y,direction.x)
#	var target = tile.neighbouringTiles[direction]
#	if target != null:
#		setTileValid(target)
#	direction = direction*-1
#	target = tile.neighbouringTiles[direction]
#	if target != null:
#		setTileValid(tile.neighbouringTiles[direction])



func setTexture():
	$pieceSprite.texture = Assets.Textures.Knight[playerID]
	
