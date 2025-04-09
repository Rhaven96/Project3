class_name State_Attack extends State

var attacking : bool = false

@export var attack_sound : AudioStream
@export_range(1, 20,0.5) var decelerate_speed : float = 5.0

@onready var walk: State = $"../Walk"
@onready var idle: State = $"../Idle"
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var attack_animation: AnimationPlayer = $"../../Sprite2D/AttackEffectSprite/AnimationPlayer"
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"
@onready var hurt_box: HurtBox = %AttackHurtBox






##What happend when player enter this state
func Enter() -> void:
	player.UpdateAnimation("attack")
	attack_animation.play("attack_"+ player.AnimationDirection())
	animation_player.animation_finished.connect(EndAttack)
	audio_stream_player_2d.stream = attack_sound
	audio_stream_player_2d.pitch_scale = randf_range(0.9 , 1.1)
	audio_stream_player_2d.play()

	attacking = true
	
	await get_tree().create_timer(0.075).timeout
		
	hurt_box.monitoring = true
	pass
	
##What happens whenm player leaves this state
func Exit() -> void:
	animation_player.animation_finished.disconnect(EndAttack)
	attacking = false
	hurt_box.monitoring = false
	pass

##What happens during _Process update in this state?
func Process(_delta : float ) -> State:
	player.velocity -= player.velocity * decelerate_speed * _delta
	
	if attacking == false :
		if player.direction == Vector2.ZERO:
			return idle
		else :
			return walk
	return null


##What happens during _physics_process update in this state?
func Physics(_delta : float ) -> State:
	return null


##WHat happend with input events in this State?
func HandleInput(_event : InputEvent ) -> State:
	return null


func EndAttack( _newAnimName : String) -> void:
	attacking = false
