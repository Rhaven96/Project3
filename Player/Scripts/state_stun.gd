class_name State_Stun extends State

@export var invulnerable_duration : float = 1.0
@export var knockback_speed : float = 200.0
@export var decelerate_speed : float = 10.0


@onready var idle: State = $"../Idle"

var hurt_box : HurtBox
var direction : Vector2

var next_state : State = null


func init() -> void:
	player.player_damaged.connect(_player_damaged)
##What happend when player enter this state
func Enter() -> void:
	player.animation_player.animation_finished.connect(_animation_finished)
	
	direction = player.global_position.direction_to(hurt_box.global_position)
	player.velocity = direction* -knockback_speed
	player.SetDirection()
	
	player.UpdateAnimation("stun")
	player.make_invulnerable(invulnerable_duration)
	player.effect_animation_player.play("damaged")
	pass
	
##What happens whenm player leaves this state
func Exit() -> void:
	next_state = null
	player.animation_player.animation_finished.disconnect(_animation_finished)
	pass

##What happens during _Process update in this state?
func Process(_delta : float ) -> State:
	player.velocity -=player.velocity * decelerate_speed * _delta
	return next_state


##What happens during _physics_process update in this state?
func Physics(_delta : float ) -> State:
	return null


##WHat happend with input events in this State?
func HandleInput(_event : InputEvent ) -> State:
	return null


func _player_damaged(_hurt_box :HurtBox) ->void:
	hurt_box = _hurt_box
	state_machine.ChangeState(self)
	pass
func _animation_finished(_a : String) ->void:
	next_state = idle
	pass
