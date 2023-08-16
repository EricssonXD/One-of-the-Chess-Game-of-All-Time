extends Node

const SCALE = 8
const BOARD_DIMENSIONS = Vector2(8,8)

const BOARD_OFFSET = Vector2(4,4) * SCALE	
const TILE_SIZE = Vector2(15, 15) * SCALE
enum TYPE {Pawn, Queen, Bishop, Rook, King, Knight, Debug}
