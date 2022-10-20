extends Node

export var uri: String = "net.test.example.mod"
export var version: String = "1.0.0"
export var dependencies = PoolStringArray(["net.test.example.othermod"])

func _ready():
	pass # Replace with function body.

func _load():
	# Called when the mod is loaded by the mod loader
	pass
