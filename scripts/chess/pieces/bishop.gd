extends ChessPiece

func get_valid_tiles():
	var hitEdge = false
	recur(onTile, Vector2(1,1))
	recur(onTile, Vector2(-1,1))
	recur(onTile, Vector2(-1,-1))
	recur(onTile, Vector2(1,-1))
	
func recur(tile: ChessTile, direction: Vector2, blocked:bool = false):
	if tile == null:
		return
	if !blocked:
		setTileValid(tile)
	if tile.piece != null and tile.piece != self:
		blocked = true
	recur(tile.neighbouringTiles[direction], direction, blocked)
	


func setTexture():
	$pieceSprite.texture = load("res://assets/pieces/white/bishop.png")
	
