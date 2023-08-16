extends ChessPiece

func  _init():
	super._init()
	self.type = CONSTANTS.TYPE.King

func _get_drag_data(at_position):
	update_valid_tiles()
	return super._get_drag_data(at_position)

func get_valid_tiles():
	for i in onTile.neighbouringTiles.values():
		if i != null:
			var v = true
			for player in i.attackedBy.keys():
				if player != playerID:
					v = false
					continue
			if v:
				setTileValid(i)

func checked():
	pass

func setTexture():
	$pieceSprite.texture = load("res://assets/pieces/white/king_with_gun_haha_funny_lmao_school_shoote.png")
	
