class_name Plant extends Node2D

@onready var hit_box: HitBox = $HitBox


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hit_box.Damaged.connect(destroy)
	pass # Replace with function body.

func destroy(hurt_box :HurtBox ) ->void:
	self.queue_free()
	pass
