extends Node

signal whenEndTurn(playerID:int)

signal checked(playerID:int)



func endTurn(playerID:int):
#	ChessGlobal.players[playerID].isChecked = true
	whenEndTurn.emit(playerID)
