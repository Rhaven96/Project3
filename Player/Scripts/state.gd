class_name State extends Node

static var player : Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

##What happend when player enter this state
func Enter() -> void:
	pass
	
##What happens whenm player leaves this state
func Exit() -> void:
	pass

##What happens during _Process update in this state?
func Process(_delta : float ) -> State:
	return null


##What happens during _physics_process update in this state?
func Physics(_delta : float ) -> State:
	return null


##WHat happend with input events in this State?
func HandleInput(_event : InputEvent ) -> State:
	return null
