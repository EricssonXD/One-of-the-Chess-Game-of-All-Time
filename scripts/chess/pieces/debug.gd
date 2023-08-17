extends ChessPiece

func  _init():
	super._init()
	self.type = CONSTANTS.TYPE.Debug
	
func get_valid_tiles():
	for i in ChessGlobal.board.values():
		setTileValid(i)
	


func setTexture():
	$pieceSprite.texture = Assets.Textures.Debug[0]
	
