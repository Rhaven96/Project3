class_name Player extends CharacterBody2D


var cardinal_direction : Vector2 = Vector2.DOWN
var direction : Vector2 = Vector2.ZERO

const DIR_4 = [Vector2.RIGHT , Vector2.DOWN, Vector2.LEFT, Vector2.UP]

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D
@onready var state_machine: PlayerStateMachine = $StateMachine

signal DirectionChanged (new_dir : Vector2)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	state_machine.Initialize(self)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#direction.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	#direction.y = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	direction = Vector2(
		Input.get_axis("Left","Right"),
		Input.get_axis("Up","Down")
	).normalized()
	pass
	
func _physics_process(delta):
	move_and_slide()



func SetDirection() -> bool:
	if direction == Vector2.ZERO:
		return false
		
	var new_direction = DIR_4[int( round((direction + cardinal_direction * 0.1 ).angle()
		/ TAU *DIR_4.size()) )]
	
	

	#Deprecated for movement which wwill make player moonwalk
	#if direction.y ==0:
	#	new_direction = Vector2.LEFT if direction.x <0 else Vector2.RIGHT
	#elif direction.x ==0:
	#	new_direction = Vector2.UP if direction.y <0 else Vector2.DOWN
		
	if new_direction == cardinal_direction:
		return false
		
	cardinal_direction = new_direction
	DirectionChanged.emit(new_direction)
	#Flip character over left since sprite is alredy flip to the right side on animation
	sprite.scale.x = -1 if cardinal_direction == Vector2.LEFT else 1
	return true


func UpdateAnimation(state : String) -> void:
	animation_player.play(state + "_"+AnimationDirection())
	pass
	
func AnimationDirection() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	else:
		return "side"
	
