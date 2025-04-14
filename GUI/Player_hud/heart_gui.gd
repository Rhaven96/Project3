class_name HeartGUI extends Control

@onready var sprite_2d: Sprite2D = $Sprite2D


var value_heart : int = 2 :
	#need to learn what set() is doing when updating value_heart
	set(_value):
		value_heart = _value
		update_sprite()

func update_sprite() -> void:
	sprite_2d.frame = value_heart
