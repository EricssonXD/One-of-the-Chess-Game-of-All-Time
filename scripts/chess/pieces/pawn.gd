extends ChessPiece

func get_valid_tiles():
	var tile = onTile.neighbouringTiles[Vector2(0,1)]
	if tile!= null:
		setTileValid(tile)
		if firstMove:
			var extraTile = tile.neighbouringTiles[Vector2(0,1)]
			if extraTile!= null:
				setTileValid(extraTile)
#				firstMove = false
	for i in [-1,1]:
		tile = onTile.neighbouringTiles[Vector2(i,1)]
		if tile!= null:
			if tile.piece != null:
				setTileValid(tile)


func setOnTile(tile:ChessTile):
	super.setOnTile(tile)
	if playerID in onTile.promotion:
		promote()

	
func promote():
	setPiece(load("res://scripts/chess/pieces/queen.gd"))
	self.firstMove = false
#	self.playerID = playerID


func setTexture():
	$pieceSprite.texture = load("res://assets/pieces/white/ches.png")
	
