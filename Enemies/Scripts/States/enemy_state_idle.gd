class_name EnemyStateIdle extends EnemyState

@export var anim_name : String = "idle"

@export_category("AI")
@export var state_duration_min : float = 0.5
@export var state_duration_max : float = 1.5
@export var after_idle_state : EnemyState


var _timer : float = 0.0

#What happens when we intialize this state?
func init() -> void:
	enemy.velocity = Vector2.ZERO
	_timer  = randf_range(state_duration_min,state_duration_max)
	enemy.UpdateAnimation(anim_name)
	
	pass

##What happend when enemy enter this state
func enter() -> void:
	
	pass
	
##What happens whenm enemy leaves this state
func exit() -> void:
	pass

##What happens during _Process update in this state?
func process(_delta : float ) -> EnemyState:
	_timer -= _delta
	if _timer <= 0:
		return after_idle_state
	return null


##What happens during _physics_process update in this state?
func physics(_delta : float ) -> EnemyState:
	return null
