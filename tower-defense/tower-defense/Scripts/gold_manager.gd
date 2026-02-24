extends Node

signal money_changed(new_money: int)

var money: int = 100:
	set(value):
		money = value
		money_changed.emit(money)
