class_name HurtBox extends Area2D

@export var damage: int = 1
@export var hurt_box : HurtBox

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(AreaEntered)
	pass # Replace with function body.



func AreaEntered( area : Area2D ) -> void:
	if area is HitBox:
		area.TakeDamage(self)
	pass
