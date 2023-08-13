extends Node

var board: Dictionary = {}
var dragging: bool = false

const res_boardTile = preload("res://prefab/chess/board_tile.tscn")
const res_debugPiece = preload("res://prefab/chess/piece.tscn")
const res_dragPreview = preload("res://prefab/ui/drag_preview.tscn")
