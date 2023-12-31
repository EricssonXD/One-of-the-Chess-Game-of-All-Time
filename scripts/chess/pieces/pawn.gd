extends ChessPiece


var forward: int = 1
var canBeEnpassant: bool = false

func  _init():
	super._init()
	self.type = CONSTANTS.TYPE.Pawn

func get_valid_tiles():
	var tile = onTile.neighbouringTiles[Vector2(0,forward)]
	if tile!= null and tile.piece == null:
		setTileValid(tile)
		if firstMove:
			var extraTile = tile.neighbouringTiles[Vector2(0,forward)]
			if extraTile!= null:
				setTileValid(extraTile)
#				firstMove = false
	for i in [-1,1]:
		tile = onTile.neighbouringTiles[Vector2(i,forward)]
		if tile!= null:
			if tile.piece != null:
				setTileValid(tile)


func setOnTile(tile:ChessTile):
	if playerID in onTile.promotion:
		promote()
	super.setOnTile(tile)


func promote():
	setPiece(load("res://scripts/chess/pieces/queen.gd"))
	self.firstMove = false
#	self.playerID = playerID

func enpassant():
	pass
	
func setTexture():
	$pieceSprite.texture = Assets.Textures.Pawn[playerID]
	
