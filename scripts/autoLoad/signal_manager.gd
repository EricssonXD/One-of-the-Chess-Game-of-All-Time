extends Node

signal whenEndTurn(playerID:int)

func endTurn(playerID:int):
	whenEndTurn.emit(playerID)
