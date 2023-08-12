extends Node

var board: Array = []
var dragging: bool = false

var res_boardTile = preload("res://prefab/chess/board_tile.tscn")
var res_debugPiece = preload("res://prefab/chess/piece.tscn")
