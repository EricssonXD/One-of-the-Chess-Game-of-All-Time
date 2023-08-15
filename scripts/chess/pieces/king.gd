extends ChessPiece

func  _init():
	super._init()
	self.type = CONSTANTS.TYPE.King

func get_valid_tiles():
	for i in onTile.neighbouringTiles.values():
		if i != null:
			setTileValid(i)
	
func recur(tile: ChessTile, direction: Vector2, blocked:bool = false):
	if tile == null:
		return
	if !blocked:
		setTileValid(tile)
	if tile.piece != null and tile.piece != self:
		blocked = true
	recur(tile.neighbouringTiles[direction], direction, blocked)
	


func setTexture():
	$pieceSprite.texture = load("res://assets/pieces/white/king_with_gun_haha_funny_lmao_school_shoote.png")
	
