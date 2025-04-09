class_name State_Walk extends State

@export var move_speed : float = 100.0
@onready var idle: State = $"../Idle"
@onready var attack: State = $"../Attack"


##What happend when player enter this state
func Enter() -> void:
	player.UpdateAnimation("walk")
	pass
	
##What happens whenm player leaves this state
func Exit() -> void:
	pass

##What happens during _Process update in this state?
func Process(_delta : float ) -> State:
	if player.direction == Vector2.ZERO:
		return idle
	
	player.velocity = player.direction * move_speed
	if player.SetDirection():
		player.UpdateAnimation("walk")
	return null


##What happens during _physics_process update in this state?
func Physics(_delta : float ) -> State:
	return null


##WHat happend with input events in this State?
func HandleInput(_event : InputEvent ) -> State:
	if _event.is_action_pressed("Attack"):
		return attack
	return null
