extends Node
class_name Assets

class Piece:
	const Rook = preload("res://scripts/chess/pieces/rook.gd")
	const Bishop = preload("res://scripts/chess/pieces/bishop.gd")
	const Knight = preload("res://scripts/chess/pieces/knight.gd")
	const Queen = preload("res://scripts/chess/pieces/queen.gd")
	const Pawn = preload("res://scripts/chess/pieces/pawn.gd")
	const King = preload("res://scripts/chess/pieces/king.gd")
	const Debug = preload("res://scripts/chess/pieces/debug.gd")

class Textures:
	const Rook = [
		preload("res://assets/pieces/white/rook.png"),
		preload("res://assets/pieces/black/rook.png"),
	]
	const Bishop = [
		preload("res://assets/pieces/white/bishop.png"),
		preload("res://assets/pieces/black/bishop.png"),
	]
	const Knight = [
		preload("res://assets/pieces/white/knight.png"),
		preload("res://assets/pieces/black/knight.png"),
	]
	const Queen = [
		preload("res://assets/pieces/white/queen.png"),
		preload("res://assets/pieces/black/queen.png"),
	]
	const Pawn = [
		preload("res://assets/pieces/white/pawn.png"),
		preload("res://assets/pieces/black/pawn.png"),
	]
	const King = [
		preload("res://assets/pieces/white/king.png"),
		preload("res://assets/pieces/black/king.png"),
	]
	const Debug = [
		preload("res://assets/pieces/white/custom/ches.png"),
		preload("res://assets/pieces/white/custom/ches-criminal.png"),
	]