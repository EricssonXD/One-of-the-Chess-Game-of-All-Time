extends Node

var board: Dictionary = {}
var dragging: bool = false

var inGame: bool = false
var players: Array[PlayerInfo] = []
# Which player's turn it is
var playerTurn: int = 0

const res_boardTile = preload("res://prefab/chess/board_tile.tscn")
const res_debugPiece = preload("res://prefab/chess/piece.tscn")
const res_dragPreview = preload("res://prefab/ui/drag_preview.tscn")

class PlayerInfo:
	var name: String = "Unnamed"
	var id: int
	var pieces: Array[ChessPiece] = []
	var blockCheck: Array[ChessTile] = []
	var isChecked


func createPlayer(name:String):
	var newPlayer = PlayerInfo.new()
	newPlayer.id = players.size()
	newPlayer.name = name
	players.append(newPlayer)
