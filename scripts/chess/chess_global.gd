extends Node

var board: Dictionary = {}
var dragging: bool = false
var players: PackedStringArray = []

# Which player's turn it is
var playerTurn: int = 0

const res_boardTile = preload("res://prefab/chess/board_tile.tscn")
const res_debugPiece = preload("res://prefab/chess/piece.tscn")
const res_dragPreview = preload("res://prefab/ui/drag_preview.tscn")
