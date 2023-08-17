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
		return
	if !blocked:
		setTileValid(tile)
	if tile.piece != null and tile.piece != self:
		if tile.piece.type != CONSTANTS.TYPE.King:
			blocked = true

	recur(tile.neighbouringTiles[direction], direction, blocked)
	


func setTexture():
	$pieceSprite.texture = Assets.Textures.Queen[playerID]

	
