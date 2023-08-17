extends ChessPiece

var dangerous = []

func  _init():
	super._init()
	self.type = CONSTANTS.TYPE.King

func _get_drag_data(at_position):
	update_valid_tiles()
	var a = super._get_drag_data(at_position)
	return a

func get_valid_tiles():
	for i in onTile.neighbouringTiles.values():
		if i != null:
			var v = true
			for player in i.attackedBy.keys():
				if player != playerID && !i.attackedBy[player].is_empty():
					v = false
					break
			if v:
				setTileValid(i)

func checked():
	pass

func setTexture():
	$pieceSprite.texture = Assets.Textures.King[playerID]
	
func _ready():
	super._ready()
	SignalManager.checked.connect(whenChecked)

func whenChecked(id:int):
	if id != playerID:
		return
	print("I am being checked")
