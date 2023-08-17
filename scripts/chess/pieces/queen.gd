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
		return
	if !blocked:
		setTileValid(tile)
	if tile.piece != null and tile.piece != self:
		blocked = true
	recur(tile.neighbouringTiles[direction], direction, blocked)
	


func setTexture():
	$pieceSprite.texture = Assets.Textures.Queen[playerID]
	
