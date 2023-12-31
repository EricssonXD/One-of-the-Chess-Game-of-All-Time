extends Node

var board: Dictionary = {}
var dragging: bool = false

var inGame: bool = false
var players: Array[ChessPlayer] = []
# Which player's turn it is
var playerTurn: int = 0

const res_boardTile = preload("res://prefab/chess/board_tile.tscn")
const res_debugPiece = preload("res://prefab/chess/piece.tscn")
const res_dragPreview = preload("res://prefab/ui/drag_preview.tscn")

class ChessPlayer:
	var name: String = "Unnamed"
	var id: int
	var pieces: Array[ChessPiece] = []
	var blockCheck: Array[ChessTile] = []
	var isChecked
	signal startTurn
	


func createPlayer(name:String):
	var newPlayer = ChessPlayer.new()
	newPlayer.id = players.size()
	newPlayer.name = name
	players.append(newPlayer)
