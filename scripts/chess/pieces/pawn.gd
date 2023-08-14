extends ChessPiece

var firstMove: bool = true

func get_valid_tiles():
	var tile = onTile.neighbouringTiles[Vector2(0,1)]
	if tile!= null:
		setTileValid(tile)
		if firstMove:
			var extraTile = tile.neighbouringTiles[Vector2(0,1)]
			if extraTile!= null:
				setTileValid(extraTile)
#				firstMove = false


func setTexture():
	$pieceSprite.texture = load("res://assets/pieces/white/ches.png")
	
