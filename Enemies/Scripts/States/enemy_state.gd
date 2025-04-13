class_name EnemyState extends Node

var enemy : Enemy
var state_machine : EnemyStateMachine



#What happens when we intialize this state?
func init() -> void:
	
	pass

##What happend when enemy enter this state
func enter() -> void:
	pass
	
##What happens whenm enemy leaves this state
func exit() -> void:
	pass

##What happens during _Process update in this state?
func process(_delta : float ) -> EnemyState:
	return null


##What happens during _physics_process update in this state?
func physics(_delta : float ) -> EnemyState:
	return null
