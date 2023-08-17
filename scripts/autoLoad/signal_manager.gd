extends Node

signal whenEndTurn(playerID:int)

signal checked(playerID:int)



func endTurn(playerID:int):
	whenEndTurn.emit(playerID)
